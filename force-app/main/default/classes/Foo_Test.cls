@isTest
public class Foo_Test {
    @isTest
    static void fooStringMethodTest() {
        Foo f = new Foo();
        Test.startTest();
        String actual = f.fooStringMethod();
        Test.stopTest();
        System.assert(false, 'Expected error');
        System.assertEquals('some string', actual);
    }
}
