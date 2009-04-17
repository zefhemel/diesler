package diesler;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import diesler.*;

public class DSLNativeMethod extends DSLMethod {

	public DSLNativeMethod(diesler.Scope scope, String selector) {
		super(scope, selector, pil.Utils.fromArrayToList(new  ASTPattern[] { new ASTIdnPattern(scope, "args") }), null);
	}

	@Override
	public DSLObject invoke(diesler.Scope scope, DSLObject self, DSLObject[] args) {
		try {
		    Object[] javaArgs = new Object[args.length];
		    Class[] argTypes = new Class[args.length];
		    for(int i = 0; i < args.length; i++) {
		        javaArgs[i] = NativeUtils.dieselToJava(args[i]);
		        argTypes[i] = javaArgs[i].getClass();
		    }
		    Object o = ((DSLNativeObject)self).getObj();
		    String methodName = selector;
		    if(methodName.endsWith(":")) {
		        methodName = methodName.replace(":", "");
		    }
			Object result = o.getClass().getMethod(methodName, argTypes).invoke(o, javaArgs);
			return NativeUtils.javaToDiesel(scope, result);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

}
