package diesler.builtin.native_;

import java.lang.reflect.Constructor;

import diesler.*;

public class NewNativeClassMethod extends DSLMethod {
	public NewNativeClassMethod(diesler.Scope scope) {
		super(scope, "new:", pil.Utils.fromArrayToList(new ASTPattern[] { new ASTIdnPattern(scope, "fullyQualifiedClassName") }), pil.Utils.fromArrayToList(new boolean[] {false}), null);
	}

	@SuppressWarnings("unchecked")
	public diesler.DSLObject invoke(diesler.Scope scope, diesler.DSLObject o, diesler.DSLObject[] args) {
		String fullyQualifiedClassName = ((diesler.DSLString) args[0]).getValue();
		DSLNativeClass cls;
		try {
			Class<Object> wrappedClass = (Class<Object>) Class.forName(fullyQualifiedClassName);
			cls = new DSLNativeClass(scope, wrappedClass);
			boolean addedNoParamOption = false;
			boolean addedParamOption = false;
			for(Constructor cnstr : wrappedClass.getConstructors()) {
				if(cnstr.getParameterTypes().length == 0 && !addedNoParamOption) {
					cls.setMethod("new", new NewNativeObjectMethod(scope, "new"));
					addedNoParamOption = true;
				} else if(cnstr.getParameterTypes().length > 0 && !addedParamOption){
					cls.setMethod("new:", new NewNativeObjectMethod(scope, "new:"));
					addedParamOption = true;
				}
			}
			return cls;
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}
}
