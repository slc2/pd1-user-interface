public with sharing class SoqlInjectionEx {
    public List<Account> queryResult {
        get {return queryResult;}
        set {queryResult = value;}
    }
    public String name {
        get { return name; }
        set { name = value; }
    }
    public String soqlText {
        get { return soqlText; }
        set { soqlText = value; }
    }
    public Pagereference query() {
        String queryString = 'Select Id, Name, Type, AnnualRevenue FROM Account ';
        queryString += 'WHERE ( Type = \'Customer - Direct\' and Name ';
        queryString += 'LIKE \'%' + name + '%\')';
        soqlText = queryString;
        queryResult = Database.query(queryString);
        return null;
    }
    public Pagereference queryEscapeSingleQuotes() {
        String escapedName = String.escapeSingleQuotes(name);
        String queryString = 'Select Id, Name, Type, AnnualRevenue FROM Account ';
        queryString += 'WHERE ( Type = \'Customer - Direct\' and Name ';
        queryString += 'LIKE \'%' + escapedName + '%\')';
        soqlText = queryString;
        queryResult = Database.query(queryString);
        return null;
    }
    public Pagereference queryBind() {
        String queryName = '%' + name + '%';
        String queryString = 'Select Id, Name, Type, AnnualRevenue FROM Account ';
        queryString += 'WHERE ( Type = \'Customer - Direct\' and Name ';
        queryString += 'LIKE :queryName)';
        soqlText = queryString;
        queryResult = Database.query(queryString);
        return null;
    }
}