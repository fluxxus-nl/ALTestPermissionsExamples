codeunit 84100 "Test TP Disabled FLX"
{
    Subtype = Test;
    TestPermissions = Disabled;

    [Test]
    procedure TestTestPermissionsDisabled()
    begin
        Initialize();

        CreateTestTable();

        LibraryLowerTestPermissions.StartLoggingNAVPermissions('D365 FULL ACCESS');
        LibraryLowerTestPermissions.AddPermissionSet('Test Permissions FLX');

        CreateTestTable();
    end;

    [Test]
    procedure TestTestPermissionsDisable2()
    begin
        Initialize();

        CreateTestTable();
    end;

    var
        Any: Codeunit "Any";
        LibraryLowerTestPermissions: Codeunit "Library - Lower Permissions";
        IsInitialized: Boolean;
        Counter: Integer;

    local procedure Initialize()
    var
        LibraryTestInitialize: Codeunit "Library - Test Initialize";
    begin
        LibraryTestInitialize.OnTestInitialize(Codeunit::"Test TP Disabled FLX");

        if IsInitialized then
            exit;

        LibraryTestInitialize.OnBeforeTestSuiteInitialize(Codeunit::"Test TP Disabled FLX");

        IsInitialized := true;

        LibraryTestInitialize.OnAfterTestSuiteInitialize(Codeunit::"Test TP Disabled FLX");
    end;

    local procedure CreateTestTable()
    var
        TestTable: Record "Test Table FLX";
    begin
        Any.SetSeed(Counter);

        TestTable.Code := Any.AlphabeticText(MaxStrLen(TestTable.Code));
        TestTable.Insert();

        Counter += 1;
    end;
}