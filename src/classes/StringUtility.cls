public class StringUtility {
	//Added a dummy comment, updated for PR
	
    public static String removeComments(String content){
        String newContent = content;
        
        //Removing long comments
        while(newContent.substringBetween('/*', '*/')!=null){
            String temp = '/*'+newContent.substringBetween('/*', '*/')+'*/';
            newContent = newContent.replace(temp, '');
        }
        
        //moving single line comments
        List<String> lines = newContent.split('\n');
        newContent = '';
        for(String line : lines){
            if(line.contains('//')){
                line = line.substringBefore('//');
            }
            newContent +=line;
        }
        return newContent;
    }
    
    public static String adjustSpaces(String content){
        content = content.replaceAll(',',' , ');
        content = content.replaceAll('(\\s+)',' ');
        content = content.replaceAll('\\(',' ( ');
        content = content.replaceAll('\\)',' ) ');
        content = content.replaceAll(';',' ; ');
        content = content.replaceAll('\\{',' { ');
        content = content.replaceAll('\\}',' } ');
        content = content.replaceAll(' <','<');
        content = content.replaceAll('< ','<');
        content = content.replaceAll(' >','>');
        content = content.replaceAll('>','> ');
        content = content.replaceAll('=',' = ');
        return content;
    }
    
    public static List<String> splitContent(String content){
        return content.split('(\\s+)');
    }
    
    //Identify whether Type needs quotes
    public static Boolean needQuotes(String passedType){
        if(passedType!=null &&(passedType.equalsIgnoreCase('String') || passedType.equalsIgnoreCase('Reference') || passedType.equalsIgnoreCase('Id'))){
            return true;
        }
        return false;
    }
    
    
    
    //Check for static property with input Set
    public static Boolean checkForStatic(Set<String> passedAccessLevelSet){
        for(String accessLevel : passedAccessLevelSet){
            if(accessLevel!=null && accessLevel.equalsIgnoreCase('static')){
                return true;
            }
        }
        return false;
    }
    
    //Check for static property with input List
    public static Boolean checkForStatic(List<String> passedAccessLevelSet){
        for(String accessLevel : passedAccessLevelSet){
            if(accessLevel!=null && accessLevel.equalsIgnoreCase('static')){
                return true;
            }
        }
        return false;
    }
    
    
    //Set returnsValue variable
    public static Boolean setReturnsValue(Type passedReturnType){
        if(passedReturnType.type!=null && passedReturnType.type.equalsIgnoreCase('void')){
            return false;
        }
        return true;
    }
}
