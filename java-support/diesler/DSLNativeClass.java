package diesler;

public class DSLNativeClass extends DSLClass {
	Class<Object> wrappedClass = null;
	
	public DSLNativeClass(diesler.Scope scope, Class<Object> wrappedClass) {
		super(scope, (DSLClass)scope.get("Object"), "DSLNativeClass");
		this.wrappedClass = wrappedClass;
	}
	
	public Class<Object> getWrappedClass() {
		return wrappedClass;
	}
}
