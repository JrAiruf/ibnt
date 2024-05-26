import 'package:ibnt/src/app_imports.dart';

/*
--------START---------- 
{
  "book": {
    "abbrev": {
      "pt": "mt",
      "en": "mt"
    },
    "name": "Mateus",
    "author": "Mateus",
    "group": "Evangelhos",
    "version": "nvi"
  },
  "chapter": {
    "number": 7,
    "verses": 29
  },
  "verses": [
    {
      "number": 1,
      "text": "\"Não julguem, para que vocês não sejam julgados."
    },
    {
      "number": 2,
      "text": "Pois da mesma forma que julgarem, vocês serão julgados; e a medida que usarem, também será usada para medir vocês."
    },
    {
      "number": 3,
      "text": "\"Por que você repara no cisco que está no olho do seu irmão, e não se dá conta da viga que está em seu próprio olho?"
    },
    {
      "number": 4,
      "text": "Como você pode dizer ao seu irmão: ‘Deixe-me tirar o cisco do seu olho’, quando há uma viga no seu?"
    },
    {
      "number": 5,
      "text": "Hipócrita, tire primeiro a viga do seu olho, e então você verá claramente para tirar o cisco do olho do seu irmão."
    },
    {
      "number": 6,
      "text": "\"Não dêem o que é sagrado aos cães, nem atirem suas pérolas aos porcos; caso contrário, estes as pisarão e, aqueles, voltando-se contra vocês, os despedaçarão\"."
    },
    {
      "number": 7,
      "text": "\"Peçam, e lhes será dado; busquem, e encontrarão; batam, e a porta lhes será aberta."
    },
    {
      "number": 8,
      "text": "Pois todo o que pede, recebe; o que busca, encontra; e àquele que bate, a porta será aberta."
    },
    {
      "number": 9,
      "text": "\"Qual de vocês, se seu filho pedir pão, lhe dará uma pedra?"
    },
    {
      "number": 10,
      "text": "Ou se pedir peixe, lhe dará uma cobra?"
    },
    {
      "number": 11,
      "text": "Se vocês, apesar de serem maus, sabem dar boas coisas aos seus filhos, quanto mais o Pai de vocês, que está nos céus, dará coisas boas aos que lhe pedirem!"
    },
    {
      "number": 12,
      "text": "Assim, em tudo, façam aos outros o que vocês querem que eles lhes façam; pois esta é a Lei e os Profetas\"."
    },
    {
      "number": 13,
      "text": "\"Entrem pela porta estreita, pois larga é a porta e amplo o caminho que leva à perdição, e são muitos os que entram por ela."
    },
    {
      "number": 14,
      "text": "Como é estreita a porta, e apertado o caminho que leva à vida! São poucos os que a encontram\"."
    },
    {
      "number": 15,
      "text": "\"Cuidado com os falsos profetas. Eles vêm a vocês vestidos de peles de ovelhas, mas por dentro são lobos devoradores."
    },
    {
      "number": 16,
      "text": "Vocês os reconhecerão por seus frutos. Pode alguém colher uvas de um espinheiro ou figos de ervas daninhas?"
    },
    {
      "number": 17,
      "text": "Semelhantemente, toda árvore boa dá frutos bons, mas a árvore ruim dá frutos ruins."
    },
    {
      "number": 18,
      "text": "A árvore boa não pode dar frutos ruins, nem a árvore ruim pode dar frutos bons."
    },
    {
      "number": 19,
      "text": "Toda árvore que não produz bons frutos é cortada e lançada ao fogo."
    },
    {
      "number": 20,
      "text": "Assim, pelos seus frutos vocês os reconhecerão!"
    },
    {
      "number": 21,
      "text": "\"Nem todo aquele que me diz: ‘Senhor, Senhor’, entrará no Reino dos céus, mas apenas aquele que faz a vontade de meu Pai que está nos céus."
    },
    {
      "number": 22,
      "text": "Muitos me dirão naquele dia: ‘Senhor, Senhor, não profetizamos nós em teu nome? Em teu nome não expulsamos demônios e não realizamos muitos milagres? ’"
    },
    {
      "number": 23,
      "text": "Então eu lhes direi claramente: ‘Nunca os conheci. Afastem-se de mim vocês, que praticam o mal! ’ \""
    },
    {
      "number": 24,
      "text": "\"Portanto, quem ouve estas minhas palavras e as pratica é como um homem prudente que construiu a sua casa sobre a rocha."
    },
    {
      "number": 25,
      "text": "Caiu a chuva, transbordaram os rios, sopraram os ventos e deram contra aquela casa, e ela não caiu, porque tinha seus alicerces na rocha."
    },
    {
      "number": 26,
      "text": "Mas quem ouve estas minhas palavras e não as pratica é como um insensato que construiu a sua casa sobre a areia."
    },
    {
      "number": 27,
      "text": "Caiu a chuva, transbordaram os rios, sopraram os ventos e deram contra aquela casa, e ela caiu. E foi grande a sua queda\"."
    },
    {
      "number": 28,
      "text": "Quando Jesus acabou de dizer essas coisas, as multidões estavam maravilhadas com o seu ensino,"
    },
    {
      "number": 29,
      "text": "porque ele as ensinava como quem tem autoridade, e não como os mestres da lei."
    }
  ]
}

// --------END---------
 */

/* 

-----------START-----------
[
  {
    "version": "acf",
    "verses": 31106
  },
  {
    "version": "apee",
    "verses": 30975
  },
  {
    "version": "bbe",
    "verses": 31104
  },
  {
    "version": "kjv",
    "verses": 31101
  },
  {
    "version": "nvi",
    "verses": 31105
  },
  {
    "version": "ra",
    "verses": 31104
  },
  {
    "version": "rvr",
    "verses": 31102
  }
]
----------END-----------
 */

final bookJson = jsonEncode({
  "abbrev": {
    "pt": "mt",
    "en": "mt",
  },
  "author": "Mateus",
  "chapters": 28,
  "comment": "",
  "group": "Evangelhos",
  "name": "Mateus",
  "testament": "NT"
});
final verseJson = jsonEncode({
  "book": {
    "abbrev": {"pt": "sl", "en": "ps"},
    "name": "Salmos",
    "author": "David, Moisés, Salomão",
    "group": "Poéticos",
    "version": "nvi"
  },
  "chapter": {"number": 23, "verses": 6},
  "verses": [
    {"number": 1, "text": "O Senhor é o meu pastor; de nada terei falta."},
    {"number": 2, "text": "Em verdes pastagens me faz repousar e me conduz a águas tranqüilas;"},
    {"number": 3, "text": "restaura-me o vigor. Guia-me nas veredas da justiça por amor do seu nome."},
    {"number": 4, "text": "Mesmo quando eu andar por um vale de trevas e morte, não temerei perigo algum, pois tu estás comigo; a tua vara e o teu cajado me protegem."},
    {"number": 5, "text": "Preparas um banquete para mim à vista dos meus inimigos. Tu me honras, ungindo a minha cabeça com óleo e fazendo transbordar o meu cálice."},
    {"number": 6, "text": "Sei que a bondade e a fidelidade me acompanharão todos os dias da minha vida, e voltarei à casa do Senhor enquanto eu viver."}
  ]
});

final bibleMessageJson = jsonEncode({
  "id": "c95af95f-a384-4c54-068d-08dc7b813808",
  "title": "No fundo do mar",
  "postDate": "2024-05-24T10:28:19.4629268+00:00",
  "creationDate": "2024-05-24T10:28:19.462936+00:00",
  "content": "Desobedecer  trás consequências gravíssimas, nas quais muitos...",
  "baseText": "Jn 3",
  "type": "generated",
  "entityType": "message",
  "reactions": [],
  "memberId": "7ca1d637-f724-4058-a28b-08dc71614ee6"
});

String user_token_mock =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwcmltYXJ5c2lkIjoiZGY1ZTA5MGUtYzBiZi00OTczLWEyODctMDhkYzcxNjE0ZWU2IiwiZW1haWwiOiJqb3MucGQyMDE5QGdtYWlsLmNvbSIsInJvbGUiOiJ1c2VyIiwibmJmIjoxNzE2NzI5MTMzLCJleHAiOjE3MTY4MTU1MzMsImlhdCI6MTcxNjcyOTEzM30.r8W4x5vkLZ5v-K8v2Dn6nnbDCnTBM-gGJRXvfbtPjVM";
