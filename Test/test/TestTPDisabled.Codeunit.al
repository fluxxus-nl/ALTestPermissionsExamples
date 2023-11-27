codeunit 84100 "Test TP Disabled FLX"
{
    Subtype = Test;
    TestPermissions = Disabled;

    [Test]
    procedure TestTestPermissionsDisabled()
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
        TestTable.Code := Any.AlphabeticText(MaxStrLen(TestTable.Code));
        TestTable.Insert();
    end;
}