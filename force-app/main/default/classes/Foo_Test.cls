@isTest
public class Foo_Test {
    @isTest
    static void fooStringMethodTest() {
        Foo f = new Foo();
        Test.startTest();
        String actual = f.fooStringMethod();
        Test.stopTest();

        System.assertEquals('some string', actual);
    }

    @isTest
    static void fooIntMethodTest() {
        Foo f = new Foo();
        Test.startTest();
        Integer actual = f.fooIntngMethod();
        Test.stopTest();

        System.assertEquals(0, actual);
    }
}
