codeunit 84101 "Test TP Restrictive FLX"
{
    Subtype = Test;
    TestPermissions = Restrictive;

    [Test]
    procedure TestTestPermissionsRestrictive()
    begin
        Initialize();

        CreateTestTable();
    end;

    var
        Any: Codeunit "Any";
        IsInitialized: Boolean;

    local procedure Initialize()
    var
        LibraryTestInitialize: Codeunit "Library - Test Initialize";
    begin
        LibraryTestInitialize.OnTestInitialize(Codeunit::"Test TP Restrictive FLX");

        if IsInitialized then
            exit;

        LibraryTestInitialize.OnBeforeTestSuiteInitialize(Codeunit::"Test TP Restrictive FLX");

        IsInitialized := true;

        LibraryTestInitialize.OnAfterTestSuiteInitialize(Codeunit::"Test TP Restrictive FLX");
    end;

    local procedure CreateTestTable()
    var
        TestTable: Record "Test Table FLX";
    begin
        TestTable.Code := Any.AlphabeticText(MaxStrLen(TestTable.Code));
        TestTable.Insert();
    end;
}