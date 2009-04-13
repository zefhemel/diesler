package diesler.builtin.native_;

import diesler.*;

public class NewNativeObjectMethod extends DSLMethod {
	public NewNativeObjectMethod(diesler.Scope scope, String selector) {
		super(scope, selector, new MatchTerm[] { new IdnMatchTerm(scope, "whatever") }, null);
	}

	@Override
	public DSLObject invoke(diesler.Scope scope, DSLObject self, DSLObject[] args) {
		if(args.length == 0) {
			DSLNativeClass cls = (DSLNativeClass)self;
			try {
				Object o = cls.getWrappedClass().newInstance();
				return new DSLNativeObject(scope, cls, o);
			} catch (Exception e) {
				return null;
			}
		} else { // not implemented yet
			DSLNativeClass cls = (DSLNativeClass)self;
			Object[] javaArgs = new Object[args.length];
		    Class[] argTypes = new Class[args.length];
		    for(int i = 0; i < args.length; i++) {
		        javaArgs[i] = NativeUtils.dieselToJava(args[i]);
		        argTypes[i] = javaArgs[i].getClass();
		    }
			try {
				Object o = cls.getWrappedClass().getConstructor(argTypes).newInstance(javaArgs);
				return new DSLNativeObject(scope, cls, o);
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}
	}
}
