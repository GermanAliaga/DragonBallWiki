
# APITEST

### Testeo de la api https://web.dragonball-api.com/

Link para acceder a la api: https://www.dragonball-api.com/api

Dentro de la página Postman se realizaron testeos del funcionamiento de la api, enviando solicitudes y recibiendo la información solicitada. A continuación se presentaran las solicitudes realizadas.

## Personajes

Para obtener el listado de todos los personajes registrados se ocupó la solicitud: https://dragonball-api.com/api/characters

https://dragonball-api.com/api/characters/4 \
De esta solicitud se espera recibir información relacionada al personaje número 4 del listado general de personajes registrados en la api. En este caso se obtuvo la siguiente información: 

{\
    "id": 4,\
    "name": "Bulma",\
    "ki": "0",\
    "maxKi": "0",\
    "race": "Human",\
    "gender": "Female",\
    "description": "Bulma es la protagonista femenina de la serie manga Dragon Ball y sus adaptaciones al anime Dragon Ball, Dragon Ball Z, Dragon Ball Super y Dragon Ball GT. Es hija del Dr. Brief y su esposa Panchy, hermana menor de Tights y una gran amiga de Son Goku con quien inicia la búsqueda de las Esferas del Dragón. En Dragon Ball Z tuvo a Trunks, primogénito de quien sería su esposo Vegeta, a su hija Bra[3] y su hijo adulto del tiempo alterno Trunks del Futuro Alternativo.",\
    "image": "https://dragonball-api.com/characters/bulma.webp", \
    "affiliation": "Z Fighter",\
    "deletedAt": null,\
    "originPlanet": {\
        "id": 2,\
        "name": "Tierra",\
        "isDestroyed": false,\
        "description": "La Tierra también llamado Mundo del Dragón (Dragon World), es el planeta principal donde se desarrolla la serie de Dragon Ball. Se encuentra en el Sistema Solar de la Vía Láctea de las Galaxias del Norte del Universo 7, lugar que supervisa el Kaio del Norte, y tiene su equivalente en el Universo 6. El hogar de los terrícolas y los Guerreros Z. Ha sido atacado en varias ocasiones por enemigos poderosos.",\
        "image": "https://dragonball-api.com/planetas/Tierra_Dragon_Ball_Z.webp", \
        "deletedAt": null\
    },\
    "transformations": []\
}

### Clasificación

También se pueden separar las búsquedas por características de los personajes, como por ejemplo su afiliación 

https://dragonball-api.com/api/characters?race=Saiyan&affiliation=Z fighter

Realiza la busqueda de todos los personajes que sean "Z fighter". Como resultado entrega a los siguientes personajes:

[\
    {\
        "id": 1,\
        "name": "Goku",\
        "ki": "60.000.000",\
        "maxKi": "90 Septillion",\
        "race": "Saiyan",\
        "gender": "Male",\
        "description": "El protagonista de la serie, conocido por su gran poder y personalidad amigable. Originalmente enviado a la Tierra como un infante volador con la misión de conquistarla. Sin embargo, el caer por un barranco le proporcionó un brutal golpe que si bien casi lo mata, este alteró su memoria y anuló todos los instintos violentos de su especie, lo que lo hizo crecer con un corazón puro y bondadoso, pero conservando todos los poderes de su raza. No obstante, en la nueva continuidad de Dragon Ball se establece que él fue enviado por sus padres a la Tierra con el objetivo de sobrevivir a toda costa a la destrucción de su planeta por parte de Freeza. Más tarde, Kakarot, ahora conocido como Son Goku, se convertiría en el príncipe consorte del monte Fry-pan y líder de los Guerreros Z, así como el mayor defensor de la Tierra y del Universo 7, logrando mantenerlos a salvo de la destrucción en innumerables ocasiones, a pesar de no considerarse a sí mismo como un héroe o salvador.",\
        "image": "https://dragonball-api.com/characters/goku_normal.webp", \
        "affiliation": "Z Fighter",\
        "deletedAt": null\
    },\
    {\
        "id": 2,\
        "name": "Vegeta",\
        "ki": "54.000.000",\
        "maxKi": "19.84 Septillion",\
        "race": "Saiyan",\
        "gender": "Male",\
        "description": "Príncipe de los Saiyans, inicialmente un villano, pero luego se une a los Z Fighters. A pesar de que a inicios de Dragon Ball Z, Vegeta cumple un papel antagónico, poco después decide rebelarse ante el Imperio de Freeza, volviéndose un aliado clave para los Guerreros Z. Con el paso del tiempo llegaría a cambiar su manera de ser, optando por permanecer y vivir en la Tierra para luchar a su lado contra las inminentes adversidades que superar. Junto con Piccolo, él es de los antiguos enemigos de Goku que ha evolucionando al pasar de ser un villano y antihéroe, a finalmente un héroe a lo largo del transcurso de la historia, convirtiéndose así en el deuteragonista de la serie.",\
        "image": "https://dragonball-api.com/characters/vegeta_normal.webp", \
        "affiliation": "Z Fighter",\
        "deletedAt": null\
    },\
    {\
        "id": 10,\
        "name": "Gohan",\
        "ki": "45.000.000",\
        "maxKi": "40 septillion",\
        "race": "Saiyan",\
        "gender": "Male",\
        "description": "Son Gohanda en su tiempo en España, o simplemente Gohan en Hispanoamérica, es uno de los personajes principales de los arcos argumentales de Dragon Ball Z, Dragon Ball Super y Dragon Ball GT. Es un mestizo entre saiyano y humano terrícola. Es el primer hijo de Son Goku y Chi-Chi, hermano mayor de Son Goten, esposo de Videl y padre de Pan.",\
        "image": "https://dragonball-api.com/characters/gohan.webp", \
        "affiliation": "Z Fighter",\
        "deletedAt": null\
    },\
    {\
        "id": 15,\
        "name": "Gotenks",\
        "ki": "65.600.000",\
        "maxKi": "34.8 Billion",\
        "race": "Saiyan",\
        "gender": "Male",\
        "description": " Gotenks también conocido inicialmente como Gotrunk en el doblaje al español de España, es el resultado de la Danza de la Fusión llevada a cabo correctamente por Goten y Trunks.",\
        "image": "https://dragonball-api.com/characters/Gotenks_Artwork.webp", \
        "affiliation": "Z Fighter",\
        "deletedAt": null\
    },\
    {\
        "id": 16,\
        "name": "Trunks",\
        "ki": "50.000.000",\
        "maxKi": "37.4 septllion",\
        "race": "Saiyan",\
        "gender": "Male",\
        "description": "Hijo de Vegeta y Bulma. Es un mestizo entre humano terrícola y Saiyano nacido en la Tierra, e hijo de Bulma y Vegeta, el cual es introducido en el Arco de los Androides y Cell. Más tarde en su vida como joven, se termina convirtiendo en un luchador de artes marciales, el mejor amigo de Son Goten y en el hermano mayor de su hermana Bra.",\
        "image": "https://dragonball-api.com/characters/Trunks_Buu_Artwork.webp", \
        "affiliation": "Z Fighter",\
        "deletedAt": null\
    },\
    {\
        "id": 18,\
        "name": "Bardock",\
        "ki": "450.000",\
        "maxKi": "180.000.000",\
        "race": "Saiyan",\
        "gender": "Male",\
        "description": "Es un saiyano de clase baja proveniente del Planeta Vegeta del Universo 7. Pertenece al Ejército Saiyano, que está bajo el liderazgo del Rey Vegeta, y es jefe de su escuadrón durante la anexión del planeta por parte de las fuerzas coloniales del Imperio de Freeza. Él es el esposo de Gine y padre biológico de Kakarotto y Raditz.",\
        "image": "https://dragonball-api.com/characters/Bardock_Artwork.webp", \
        "affiliation": "Z Fighter",\
        "deletedAt": null\
    },\
    {\
        "id": 65,\
        "name": "Gogeta",\
        "ki": "250 Billion",\
        "maxKi": "15 septillion",\
        "race": "Saiyan",\
        "gender": "Male",\
        "description": "Gogeta es la fusión resultante de Son Goku y Vegeta, cuando realizan la Danza de la Fusión correctamente para enfrentarse a Broly. Su voz es una voz dual que contiene las voces de Goku y Vegeta. Junto con el poder todopoderoso de los dos, con la astucia y perspicacia de Vegeta, y la habilidad pródiga de las artes marciales de Goku, es uno de los guerreros más temibles para desafiar a una pelea.",\
        "image": "https://dragonball-api.com/transformaciones/gogeta.webp", \
        "affiliation": "Z Fighter",\
        "deletedAt": null\
    },\
    {\
        "id": 66,\
        "name": "Vegetto",\
        "ki": "180 Billion",\
        "maxKi": "10.8 Septillion",\
        "race": "Saiyan",\
        "gender": "Male",\
        "description": "Vegetto es el personaje más fuerte dentro del manga original y uno de los personajes más poderosos de toda la serie en general. Su poder es el resultado del máximo poder combinado de Goku y Vegeta, multiplicado varias veces su fuerza, siendo una de las fusiones más poderosas dentro de la franquicia.",\
        "image": "https://dragonball-api.com/transformaciones/Vegetto.webp", \
        "affiliation": "Z Fighter",\
        "deletedAt": null\
    }\
]

## Planetas

También se realizó la solicitud: https://dragonball-api.com/api/planets , la cual arrojó como resultado todos los planetas registrados.

Para obtener la información de un solo planeta se debe de ocupar el siguiente formato: https://dragonball-api.com/api/planets/6 , en este caso se obtiene información relacionada al planeta número 6 de la lista registrada en la api. La información obtenida fue la siguiente:

{\
    "id": 6,\
    "name": "Monmar",\
    "isDestroyed": false,\
    "description": "Planeta donde Gohan y Krillin encontraron las Dragon Balls para revivir a sus amigos durante la Saga de Namek.",\
    "image": "https://dragonball-api.com/planetas/monmar.webp", \
    "deletedAt": null,\
    "characters": []\
}

## Errores

Uno de los errores encontrados en el testeo, es que hay imágenes que en su link de acceso contienen espacios, por lo que dificulta la visualización de estas mismas al momento de seleccionar al personaje o planeta. Esto se puede evidenciar al buscar al personaje número 44 de la lista.

https://dragonball-api.com/api/characters/44 

{\
    "id": 44,\
    "name": "Grand Priest ",\
    "ki": "969 Googolplex",\
    "maxKi": "969 Googolplex",\
    "race": "Angel",\
    "gender": "Male",\
    "description": "El Gran Sacerdote es el supervisor del torneo y uno de los seres más poderosos. Gran Ministro de los Omni-Reyes , es un ángel que actúa como asesor cercano y figura guía de Zenón y del Futuro Zenón . De vez en cuando hace cumplir los Decretos Divinos de los Zenos y da la bienvenida a los invitados a su palacio . El Gran Ministro es también padre de trece Ángeles, de los cuales doce sirven a los Dioses de la Destrucción . Por su posición y poder, es quizás el segundo ser más fuerte del Multiverso .",\
    "image": "https://dragonball-api.com/characters/Grand priest.webp", \
    "affiliation": "Other",\
    "deletedAt": null,\
    "originPlanet": {\
        "id": 24,\
        "name": "Templo móvil del Rey de Todo",\
        "isDestroyed": false,\
        "description": "El templo móvil del Rey de Todo (sala del trono), es como su nombre lo indica, un templo móvil en el cual reside los tronos de los dos Reyes de Todo en el Lugar de Supervivencia en Dragon Ball Super.",\
        "image": "https://dragonball-api.com/planetas/Trono_del_Rey_de_Todo.webp", \
        "deletedAt": null\
    },\
    "transformations": []\
}