Feature: Loging on page

Scenario: Login in Page
    Given url apiURL
    Given path 'users/login'
    And request 
    """
     {
         "user": {
        "email": "dmoreno@qvision.com.co",
        "password": "Matrix200."
             }
        }
    """
    And method Post
    Then status 200
    And print response.user.token
    * def authToken = response.user.token
