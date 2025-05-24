*** Settings ***
Library     RequestsLibrary
Variables    ./Artist_to_Add.py
*** Variables ***
${API_BASE_ENDPOINT}    http://localhost:8080

*** Test cases ***
TC_001_Get_Request_Fetch_Albums
    Create Session  Test_API    ${API_BASE_ENDPOINT}
    ${Get_Response}=    Get On Session     Test_API    /albums
    ${Status_Code}=     Convert to string   ${Get_Response.status_code}
    Should be equal     ${Status_Code}     200

TC_002_Get_Request_Fetch_Album_By_Id
    Create Session  Test_API    ${API_BASE_ENDPOINT}
    Get On Session     Test_API    /album/1

TC_003_Post_Request_Add_Album
    ${headers}=    create dictionary   Content-Type=application/json
    Create Session  Test_API    ${API_BASE_ENDPOINT}    headers=${headers}
    Post On Session     Test_API    /albums     json=${artist}    headers=${headers}