import 'package:my_journey_planning/model.dart';

const url_host = "mvvvip1.defas-fgi.de";
const url_path = "/mvv/XML_STOPFINDER_REQUEST";

List<Recomendation> recomendation = [
  Recomendation(
    name: 'Grünerhof',
    desc:
        'You should know where to go to find it but it is really nice, vegetables and fruit look good, what I bought was really good. Price wise seems good, good offer including milk, cheese and yogurts',
    coord: Coordinates(lat: 48.1842708, lon: 11.7036575),
  ),
  Recomendation(
    name: 'Schongau',
    desc:
        'Schongau is a municipality located in the district of Weilheim-Schongau, in the federal state of Bavaria, with a population at the end of 2016 of about 12,252 inhabitants.',
    coord: Coordinates(lat: 47.8124939, lon: 10.8528121),
  ),
  Recomendation(
    name: 'Riedenburg',
    desc:
        'It is located in the center of the state, in the Lower Bavaria region, on the banks of the Altmühl river, a tributary of the Danube.',
    coord: Coordinates(lat: 48.9698016, lon: 11.6169356),
  ),
];
