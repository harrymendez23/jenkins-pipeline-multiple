@isTest
public without sharing class BarTest {
    @isTest
    static void barStringMethodTest() {
        Bar b = new Bar();
        Test.startTest();
        String actual = b.barStringMethod();
        Test.stopTest();

        System.assertEquals('bar string', actual);
    }

    @isTest
    static void ishouldReturnInteger() {
        Bar b = new Bar();
        Test.startTest();
        Integer actual = b.barIntergerMethod();
        Test.stopTest();

        system.assertEquals(2, actual);
    }

    @isTest
    static void ishouldReturnBoolean() {
        Bar b = new Bar();
        Test.startTest();
        Boolean actual = b.barBoolMethod();
        Test.stopTest();

        system.assertEquals(false, actual);
    }
}
