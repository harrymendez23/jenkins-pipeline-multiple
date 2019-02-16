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
}
