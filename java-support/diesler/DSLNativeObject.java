package diesler;

import java.lang.reflect.Method;

import diesler.exception.NoSuchMethodException;

public class DSLNativeObject extends DSLObject {
	Object obj = null;
	
	public DSLNativeObject(DSLClass cls, Object obj) {
		super(cls);
		this.obj = obj;
	}

	@Override
	public DSLMethod getMethod(String selector) {
		try {
			return super.getMethod(selector);
		} catch(NoSuchMethodException ex) {
			Class<Object> cls = (Class<Object>) obj.getClass();
			for(Method m : cls.getMethods()) {
				if(m.getParameterTypes().length == 0 && m.getName().equals(selector)) {
					return new DSLNativeMethod(selector);
				} else if(m.getParameterTypes().length > 0 && selector.equals(m.getName() + ":")) {
					return new DSLNativeMethod(selector);
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
