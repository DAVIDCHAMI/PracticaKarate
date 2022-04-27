Feature: Get all tags

Background: Define url
    Given url apiURL
    * def tokenResponse = callonce read('classpath:helpers/Login.feature')
    * def token = tokenResponse.authToken

Scenario: call name the tags 
Given path 'tags'
Given header Authorization = 'Token ' + token
When method Get
Then status 200
# que contenga estas opciones
Then match response.tags contains ['karate','Formación']
#Then match response.tags !contains 'servicios'
# validar si contiene alguno de estas opciones
Then match response.tags contains any ['karate','malo']
# validar el tipo de respuesta
Then match response.tags == '#array'
#validar si tiene un número
#Then match response.tags == '#number'
#para recorrer y validar cada nodo
Then match each response.tags == '#string'

Scenario: get all articles from the page
    Given path 'articles'
    Given header Authorization = 'Token ' + token
    And param limit = 10
    And param offset = 0
    When method Get
    Then status 200
    #validar la cantidad de elementos o nodos en la respuesta en este caso array
    And match response.articles == '#[4]'
    #validarq que sea igual
    And match response.articlesCount == 4
    # validar respuesta completa
    And match response == {"articles": '#[4]',"articlesCount": 4}
    # que sea diferente a 100
    And match response.articlesCount != 100 
    # validar un nodo en especifico 
    And match response.articles[0].createdAt contains '2022'
    # validar en cualquier nodo
    And match response.articles[*].favoritesCount contains 696
    And match response.articles[*].author.bio contains null
    ## simplificar
    And match response..bio contains null
    ## validar si encuenta algo null que no falle
    And match response..bio contains '##string'
    And match each response..following == false 
    #que tambien valide verdadero 
    And match each response..following == '#boolean'
    And match each response..favoritesCount == '#number'


