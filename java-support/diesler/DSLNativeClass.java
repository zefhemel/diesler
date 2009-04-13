package diesler;

public class DSLNativeClass extends DSLClass {
	Class<Object> wrappedClass = null;
	
	public DSLNativeClass(Class<Object> wrappedClass) {
		super(RootNamespace.rootNamespace.get("Object"), "DSLNativeClass");
		this.wrappedClass = wrappedClass;
	}
	
	public Class<Object> getWrappedClass() {
		return wrappedClass;
	}
}
