codeunit 84103 "Extend Basic Permissions FLX"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Library - Test Initialize", OnTestInitialize, '', false, false)]
    local procedure OnTestInitialize(CallerCodeunitID: Integer);
    var
        LibraryLowerPermissions: Codeunit "Library - Lower Permissions";
    begin
        case CallerCodeunitID of
            Codeunit::"Test TP Restrictive FLX",
            Codeunit::"Test TP NonRestrictive FLX":
                LibraryLowerPermissions.AddPermissionSet('Test Permissions FLX');
        end;
    end;
}