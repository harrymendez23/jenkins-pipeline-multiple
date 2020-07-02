public with sharing class Bar {
    public String barStringMethod() {
        return 'bar string';
    }

    public Integer barIntergerMethod() {
        return Integer.valueOf(10 / 5);
    }

    public Boolean barBoolMethod() {
        return Boolean.valueOf('false');
    }

    public void longParameterList(string a, String b, String c, String d, String e) {
        System.debug('too many parameters');
    }
}
