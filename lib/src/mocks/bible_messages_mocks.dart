// ignore_for_file: non_constant_identifier_names

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

final messageMap = {
  "title": "message title",
  "content": "message content",
  "baseText": "message baseText",
  "memberId": "memberId",
};
String user_token_mock =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwcmltYXJ5c2lkIjoiZGY1ZTA5MGUtYzBiZi00OTczLWEyODctMDhkYzcxNjE0ZWU2IiwiZW1haWwiOiJqb3MucGQyMDE5QGdtYWlsLmNvbSIsInJvbGUiOiJ1c2VyIiwibmJmIjoxNzE3MDgzMDA2LCJleHAiOjE3MTcxNjk0MDYsImlhdCI6MTcxNzA4MzAwNn0.mJdPWe0LpRBDDlfz_4TcEDr1zU-zBBMu4GSUaFRcstI";

final memberMessagesList = jsonEncode([
  {
    "id": "156b77b6-ca9c-4d32-0698-08dc7b813808",
    "title": "Testing Title",
    "postDate": "2024-05-25T00:30:20.1644401",
    "creationDate": "2024-05-25T00:30:20.1644414",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "a0fb6063-d281-4598-0699-08dc7b813808",
    "title": "Testing Title",
    "postDate": "2024-05-25T00:30:38.8585709",
    "creationDate": "2024-05-25T00:30:38.8585722",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "3c37bded-6ca2-46c5-069b-08dc7b813808",
    "title": "Testing Title",
    "postDate": "2024-05-25T00:59:07.0219893",
    "creationDate": "2024-05-25T00:59:07.0219907",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "caec6bdc-38a4-435c-069d-08dc7b813808",
    "title": "Testing Title",
    "postDate": "2024-05-25T02:14:06.2071307",
    "creationDate": "2024-05-25T02:14:06.2071378",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "9de627b6-1570-4565-069f-08dc7b813808",
    "title": "Testing Title",
    "postDate": "2024-05-25T02:28:46.8711727",
    "creationDate": "2024-05-25T02:28:46.8711738",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "71ac3c1d-106a-48a9-06a1-08dc7b813808",
    "title": "Testing Title",
    "postDate": "2024-05-25T02:32:18.4798721",
    "creationDate": "2024-05-25T02:32:18.4798735",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "fe4f96cb-1d6c-4319-06a3-08dc7b813808",
    "title": "Testing Title",
    "postDate": "2024-05-25T02:32:48.6033183",
    "creationDate": "2024-05-25T02:32:48.6033195",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "bd41da55-94d7-4f45-06a5-08dc7b813808",
    "title": "Testing Title",
    "postDate": "2024-05-25T02:33:09.095479",
    "creationDate": "2024-05-25T02:33:09.0954801",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "7e1c01ff-eebb-4c08-06cc-08dc7b813808",
    "title": "Testing Title",
    "postDate": "2024-05-28T00:14:44.202559",
    "creationDate": "2024-05-28T00:14:44.2025599",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "1aae8bb3-ae2c-4932-06b3-08dc7b813808",
    "title": "Testing Title",
    "postDate": "2024-05-25T23:49:42.6164269",
    "creationDate": "2024-05-25T23:49:42.6164283",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "842bc05e-b3f0-44f7-06b4-08dc7b813808",
    "title": "Testing Title",
    "postDate": "2024-05-26T13:13:25.4466724",
    "creationDate": "2024-05-26T13:13:25.4466733",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "9751e6ed-6acf-404e-06b6-08dc7b813808",
    "title": "Testing Title",
    "postDate": "2024-05-26T13:13:53.8613397",
    "creationDate": "2024-05-26T13:13:53.8613404",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "4b4eb00f-a0bf-4f9f-06cd-08dc7b813808",
    "title": "Testing Title",
    "postDate": "2024-05-28T00:15:43.380304",
    "creationDate": "2024-05-28T00:15:43.380305",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "13d43db0-06a7-4295-06c3-08dc7b813808",
    "title": "Testing Title",
    "postDate": "2024-05-27T10:28:03.3569702",
    "creationDate": "2024-05-27T10:28:03.3569716",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "cc68ede9-634b-4b15-06c5-08dc7b813808",
    "title": "Testing Title",
    "postDate": "2024-05-27T10:48:45.2101676",
    "creationDate": "2024-05-27T10:48:45.2101685",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "5c4ff0be-8a76-40a9-06c7-08dc7b813808",
    "title": "Testing Title",
    "postDate": "2024-05-27T16:04:26.279932",
    "creationDate": "2024-05-27T16:04:26.2799348",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "770b1e28-c8e4-4119-06c9-08dc7b813808",
    "title": "Testing Title",
    "postDate": "2024-05-27T22:44:21.397046",
    "creationDate": "2024-05-27T22:44:21.3970482",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "cb4f8ad1-c99e-42af-06ca-08dc7b813808",
    "title": "Testing Title",
    "postDate": "2024-05-27T22:44:39.6953149",
    "creationDate": "2024-05-27T22:44:39.6953157",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "fc0666c3-782a-450b-06cb-08dc7b813808",
    "title": "Testing Title",
    "postDate": "2024-05-28T00:14:00.315073",
    "creationDate": "2024-05-28T00:14:00.315077",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "5e17d97a-f468-4feb-06cf-08dc7b813808",
    "title": "Testing Title",
    "postDate": "2024-05-28T00:17:32.9109195",
    "creationDate": "2024-05-28T00:17:32.9109206",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "52d4ce31-e7d4-45e1-06d1-08dc7b813808",
    "title": "Testing Title",
    "postDate": "2024-05-28T00:27:32.1493327",
    "creationDate": "2024-05-28T00:27:32.1493341",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "43962bee-1c53-49b9-06d2-08dc7b813808",
    "title": "Testing Title",
    "postDate": "2024-05-28T00:27:33.9479158",
    "creationDate": "2024-05-28T00:27:33.9479165",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "e8a04ae7-ad21-4b82-06d4-08dc7b813808",
    "title": "Testing Title",
    "postDate": "2024-05-28T00:28:27.2292096",
    "creationDate": "2024-05-28T00:28:27.2292106",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "ff3e6482-7182-4481-0e93-08dc7fc7c1b2",
    "title": "Testing Title",
    "postDate": "2024-05-29T10:11:50.4145385",
    "creationDate": "2024-05-29T10:11:50.4145401",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "8a52f979-2eac-4970-0e94-08dc7fc7c1b2",
    "title": "Testing Title",
    "postDate": "2024-05-29T10:13:12.4311914",
    "creationDate": "2024-05-29T10:13:12.4311928",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "24a12d51-05b1-4623-0e95-08dc7fc7c1b2",
    "title": "Testing Title",
    "postDate": "2024-05-29T10:13:48.7894757",
    "creationDate": "2024-05-29T10:13:48.7894769",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "344f3fa1-9ca9-4dfc-0e96-08dc7fc7c1b2",
    "title": "Testing Title",
    "postDate": "2024-05-29T10:14:32.5165503",
    "creationDate": "2024-05-29T10:14:32.5165518",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "b6360b05-7052-4708-0e97-08dc7fc7c1b2",
    "title": "Testing Title",
    "postDate": "2024-05-29T10:18:45.345513",
    "creationDate": "2024-05-29T10:18:45.3455143",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "9d2553cd-71b3-4f02-0e98-08dc7fc7c1b2",
    "title": "Testing Title",
    "postDate": "2024-05-29T10:19:37.0377666",
    "creationDate": "2024-05-29T10:19:37.037768",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "4ef540c7-430b-4835-0e99-08dc7fc7c1b2",
    "title": "Testing Title",
    "postDate": "2024-05-29T10:20:44.6275264",
    "creationDate": "2024-05-29T10:20:44.6275273",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "f409a796-3df1-43a6-0e9a-08dc7fc7c1b2",
    "title": "Testing Title",
    "postDate": "2024-05-29T10:23:14.2998294",
    "creationDate": "2024-05-29T10:23:14.2998304",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "244b8c3a-8f25-43cd-0e9b-08dc7fc7c1b2",
    "title": "Testing Title",
    "postDate": "2024-05-29T10:32:01.4479682",
    "creationDate": "2024-05-29T10:32:01.4479691",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "4cfe504c-1640-4053-0e9c-08dc7fc7c1b2",
    "title": "Testing Title",
    "postDate": "2024-05-29T10:33:13.9815201",
    "creationDate": "2024-05-29T10:33:13.9815211",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "0f707007-729a-4405-0e9d-08dc7fc7c1b2",
    "title": "Testing Title",
    "postDate": "2024-05-29T10:36:08.3129789",
    "creationDate": "2024-05-29T10:36:08.3129796",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "4437b0e2-2140-4a3b-0e9f-08dc7fc7c1b2",
    "title": "Testing Title",
    "postDate": "2024-05-29T10:36:45.5971948",
    "creationDate": "2024-05-29T10:36:45.5971954",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  },
  {
    "id": "fe9d5985-6757-4ca8-0ea1-08dc7fc7c1b2",
    "title": "Testing Title",
    "postDate": "2024-05-29T10:40:19.25529",
    "creationDate": "2024-05-29T10:40:19.2552911",
    "content": "Testing Message",
    "baseText": "Testing Base Text",
    "type": "created",
    "entityType": "message",
    "memberId": "3c3e1563-cb6a-46ae-5b92-08dc7c441249"
  }
]);
