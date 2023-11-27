codeunit 84102 "Test TP NonRestrictive FLX"
{
    Subtype = Test;
    TestPermissions = NonRestrictive;

    [Test]
    procedure TestTestPermissionsNonRestrictive()
    begin
        Initialize();

        CreateTestTable();
    end;

    [Test]
    procedure TestTestPermissionsNonRestrictive2()
    begin
        Initialize();

        CreateTestTable();
    end;

    var
        Any: Codeunit "Any";
        LibraryLowerTestPermissions: Codeunit "Library - Lower Permissions";
        IsInitialized: Boolean;

    local procedure Initialize()
    var
        LibraryTestInitialize: Codeunit "Library - Test Initialize";
    begin
        LibraryTestInitialize.OnTestInitialize(Codeunit::"Test TP NonRestrictive FLX");

        if IsInitialized then
            exit;

        LibraryTestInitialize.OnBeforeTestSuiteInitialize(Codeunit::"Test TP NonRestrictive FLX");

        LibraryLowerTestPermissions.AddPermissionSet('Test Permissions FLX');

        IsInitialized := true;

        LibraryTestInitialize.OnAfterTestSuiteInitialize(Codeunit::"Test TP NonRestrictive FLX");
    end;

    local procedure CreateTestTable()
    var
        TestTable: Record "Test Table FLX";
    begin
        TestTable.Code := Any.AlphabeticText(MaxStrLen(TestTable.Code));
        TestTable.Insert();
    end;
}