package diesler;

import java.lang.reflect.Method;

import diesler.exception.NoSuchMethodException;

public class DSLNativeObject extends DSLObject {
	Object obj = null;
	diesler.Scope scope;
	
	public DSLNativeObject(diesler.Scope scope, DSLClass cls, Object obj) {
		super(cls);
		this.obj = obj;
		this.scope = scope;
	}

	@Override
	public DSLMethod getMethod(String selector) {
	    if(super.getMethod(selector) != null) {
	        return super.getMethod(selector);
		} else {
			Class<Object> cls = (Class<Object>) obj.getClass();
			for(Method m : cls.getMethods()) {
				if(m.getParameterTypes().length == 0 && m.getName().equals(selector)) {
					return new DSLNativeMethod(scope, selector);
				} else if(m.getParameterTypes().length > 0 && selector.equals(m.getName() + ":")) {
					return new DSLNativeMethod(scope, selector);
				}
			}
			throw new NoSuchMethodException(selector);
		}
	}
	
	public Object getObj() {
		return obj;
	}
	
	public String toString() {
	    return obj.toString();
	}
}
