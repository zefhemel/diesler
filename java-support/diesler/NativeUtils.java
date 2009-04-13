package diesler;

public class NativeUtils {
    public static Object dieselToJava(DSLObject o) {
        if(o instanceof DSLString) {
            return ((DSLString)o).getValue();
        }
        if(o instanceof DSLInt) {
            return ((DSLInt)o).getValue();
        }
        if(o instanceof DSLNativeObject) {
            return ((DSLNativeObject)o).getObj();
        }
        throw new RuntimeException("Could not convert this diesler object: " + o);
    }
    
    public static DSLObject javaToDiesel(Object o) {
        if(o instanceof String) {
            return new DSLString((String)o);
        }
        if(o instanceof Integer) {
            return new DSLInt((Integer)o);
        }
        return new DSLNativeObject(new DSLNativeClass((Class<Object>)o.getClass()), o);
    }
}