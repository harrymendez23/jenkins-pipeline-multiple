@isTest
public class Foo_Test {
    @isTest
    static void fooStringMethodTest() {
        Foo f = new foo();
        Test.startTest();
        String actual = f.fooStringMethod();
        Test.stopTest();

        System.assertEquals('some string', actual);
    }
}
