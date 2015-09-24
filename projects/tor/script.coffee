mainFunction = () ->
  
  if window.intRunn? then clearInterval(window.intRunn)

  Array::unique = ->
    output = {}
    output[@[key]] = @[key] for key in [0...@length]
    value for key, value of output
  
  ## ------- PARAMETRI E DATI -------- ##

  # dati statici, non dovrebbero cambiare #

  dataBasi = {"B1":{"nome":"Partenza","km":"0","next":"11","dislivelloAccumulato":"0","baseVita":false},"B2":{"nome":"Youlaz","km":"11","next":"6","dislivelloAccumulato":"1364","baseVita":false},"B3":{"nome":"La Thuile","km":"17","next":"15","dislivelloAccumulato":"1364","baseVita":false},"B4":{"nome":"Promoud","km":"32","next":"5","dislivelloAccumulato":"3206","baseVita":false},"B5":{"nome":"Crosatie","km":"37","next":"6","dislivelloAccumulato":"4206","baseVita":false},"B6":{"nome":"Planaval","km":"43","next":"6","dislivelloAccumulato":"4206","baseVita":false},"B7":{"nome":"Valgris. IN","km":"49","next":"0","dislivelloAccumulato":"4206","baseVita":true},"B8":{"nome":"Valgris. OUT","km":"49","next":"8","dislivelloAccumulato":"4206","baseVita":true},"B9":{"nome":"Epée","km":"57","next":"8","dislivelloAccumulato":"4706","baseVita":false},"B10":{"nome":"Rhemes","km":"65","next":"5","dislivelloAccumulato":"5418","baseVita":false},"B11":{"nome":"Entrelor","km":"70","next":"9","dislivelloAccumulato":"6701","baseVita":false},"B12":{"nome":"Eaux Rousses","km":"79","next":"10","dislivelloAccumulato":"6701","baseVita":false},"B13":{"nome":"Loson","km":"89","next":"3","dislivelloAccumulato":"8343","baseVita":false},"B14":{"nome":"Sella","km":"92","next":"10","dislivelloAccumulato":"8343","baseVita":false},"B15":{"nome":"Cogne IN","km":"102","next":"0","dislivelloAccumulato":"8343","baseVita":true},"B16":{"nome":"Cogne OUT","km":"102","next":"5","dislivelloAccumulato":"8343","baseVita":true},"B17":{"nome":"Goilles","km":"107","next":"9","dislivelloAccumulato":"8843","baseVita":false},"B18":{"nome":"Sogno","km":"116","next":"7","dislivelloAccumulato":"9362","baseVita":false},"B19":{"nome":"Dondena","km":"123","next":"6","dislivelloAccumulato":"9655","baseVita":false},"B20":{"nome":"Chardonney","km":"129","next":"10","dislivelloAccumulato":"9655","baseVita":false},"B21":{"nome":"Pontboset","km":"139","next":"9","dislivelloAccumulato":"9655","baseVita":false},"B22":{"nome":"Donnas IN","km":"148","next":"0","dislivelloAccumulato":"9655","baseVita":true},"B23":{"nome":"Donnas OUT","km":"148","next":"6","dislivelloAccumulato":"9655","baseVita":true},"B24":{"nome":"Perloz","km":"154","next":"7","dislivelloAccumulato":"10287","baseVita":false},"B25":{"nome":"Sassa","km":"161","next":"4","dislivelloAccumulato":"11095","baseVita":false},"B26":{"nome":"Rifugio Coda","km":"165","next":"7","dislivelloAccumulato":"12014","baseVita":false},"B27":{"nome":"Lago Vargno","km":"172","next":"6","dislivelloAccumulato":"12014","baseVita":false},"B28":{"nome":"Lago Chiaro","km":"178","next":"3","dislivelloAccumulato":"12214","baseVita":false},"B29":{"nome":"Colle Vecchia","km":"181","next":"5","dislivelloAccumulato":"12414","baseVita":false},"B30":{"nome":"Niel","km":"186","next":"5","dislivelloAccumulato":"12655","baseVita":false},"B31":{"nome":"Loo","km":"191","next":"9","dislivelloAccumulato":"13487","baseVita":false},"B32":{"nome":"Gressoney IN","km":"200","next":"0","dislivelloAccumulato":"13847","baseVita":true},"B33":{"nome":"Gressoney OUT","km":"200","next":"7","dislivelloAccumulato":"13847","baseVita":true},"B34":{"nome":"Alpenzu","km":"207","next":"3","dislivelloAccumulato":"14004","baseVita":false},"B35":{"nome":"Crest","km":"210","next":"12","dislivelloAccumulato":"15004","baseVita":false},"B36":{"nome":"Saint Jacques","km":"222","next":"4","dislivelloAccumulato":"15128","baseVita":false},"B37":{"nome":"Tournalin","km":"226","next":"10","dislivelloAccumulato":"15828","baseVita":false},"B38":{"nome":"Valtourn. IN","km":"236","next":"0","dislivelloAccumulato":"16248","baseVita":true},"B39":{"nome":"Valtourn. OUT","km":"236","next":"13","dislivelloAccumulato":"16248","baseVita":true},"B40":{"nome":"Barmasse","km":"249","next":"1","dislivelloAccumulato":"16848","baseVita":false},"B41":{"nome":"Vareton","km":"250","next":"2","dislivelloAccumulato":"17340","baseVita":false},"B42":{"nome":"Reboulaz","km":"252","next":"4","dislivelloAccumulato":"17842","baseVita":false},"B43":{"nome":"Cuney","km":"256","next":"4","dislivelloAccumulato":"18173","baseVita":false},"B44":{"nome":"Clermont","km":"260","next":"10","dislivelloAccumulato":"18173","baseVita":false},"B45":{"nome":"Oyace","km":"270","next":"4","dislivelloAccumulato":"18607","baseVita":false},"B46":{"nome":"Bruson Arp","km":"274","next":"2","dislivelloAccumulato":"19207","baseVita":false},"B47":{"nome":"Bruson Colle","km":"276","next":"2","dislivelloAccumulato":"19652","baseVita":false},"B48":{"nome":"Berio","km":"278","next":"5","dislivelloAccumulato":"19652","baseVita":false},"B49":{"nome":"Ollomont IN","km":"283","next":"0","dislivelloAccumulato":"19652","baseVita":true},"B50":{"nome":"Ollomont OUT","km":"283","next":"5","dislivelloAccumulato":"19652","baseVita":true},"B51":{"nome":"Champillon","km":"288","next":"4","dislivelloAccumulato":"20963","baseVita":false},"B52":{"nome":"Ponteille","km":"292","next":"11","dislivelloAccumulato":"20963","baseVita":false},"B53":{"nome":"Bosses","km":"303","next":"11","dislivelloAccumulato":"21104","baseVita":false},"B54":{"nome":"Frassati","km":"314","next":"7","dislivelloAccumulato":"22304","baseVita":false},"B55":{"nome":"Bonatti","km":"321","next":"7","dislivelloAccumulato":"23114","baseVita":false},"B56":{"nome":"Bertone","km":"328","next":"4","dislivelloAccumulato":"23214","baseVita":false},"B57":{"nome":"Arrivo","km":"332","next":"0","dislivelloAccumulato":"23300","baseVita":false}}
  #dataBasi = {"B1":{"nome":"Partenza","km":"0","dislivelloAccumulato":"0","baseVita":false},"B2":{"nome":"Youlaz","km":"11","dislivelloAccumulato":"1364","baseVita":false},"B3":{"nome":"La Thuile","km":"17","dislivelloAccumulato":"1364","baseVita":false},"B4":{"nome":"Promoud","km":"32","dislivelloAccumulato":"3206","baseVita":false},"B5":{"nome":"Crosatie","km":"37","dislivelloAccumulato":"4206","baseVita":false},"B6":{"nome":"Planaval","km":"43","dislivelloAccumulato":"4206","baseVita":false},"B7":{"nome":"Valgrisenche IN","km":"49","dislivelloAccumulato":"4206","baseVita":true},"B8":{"nome":"Valgrisenche OUT","km":"49","dislivelloAccumulato":"4206","baseVita":true},"B9":{"nome":"Epée","km":"57","dislivelloAccumulato":"4706","baseVita":false},"B10":{"nome":"Rhemes","km":"65","dislivelloAccumulato":"5418","baseVita":false},"B11":{"nome":"Entrelor","km":"70","dislivelloAccumulato":"6701","baseVita":false},"B12":{"nome":"Eaux Rousses","km":"79","dislivelloAccumulato":"6701","baseVita":false},"B13":{"nome":"Loson","km":"89","dislivelloAccumulato":"8343","baseVita":false},"B14":{"nome":"Sella","km":"92","dislivelloAccumulato":"8343","baseVita":false},"B15":{"nome":"Cogne IN","km":"102","dislivelloAccumulato":"8343","baseVita":true},"B16":{"nome":"Cogne OUT","km":"102","dislivelloAccumulato":"8343","baseVita":true},"B17":{"nome":"Goilles","km":"107","dislivelloAccumulato":"8843","baseVita":false},"B18":{"nome":"Sogno","km":"116","dislivelloAccumulato":"9362","baseVita":false},"B19":{"nome":"Dondena","km":"123","dislivelloAccumulato":"9655","baseVita":false},"B20":{"nome":"Chardonney","km":"129","dislivelloAccumulato":"9655","baseVita":false},"B21":{"nome":"Pontboset","km":"139","dislivelloAccumulato":"9655","baseVita":false},"B22":{"nome":"Donnas IN","km":"148","dislivelloAccumulato":"9655","baseVita":true},"B23":{"nome":"Donnas OUT","km":"148","dislivelloAccumulato":"9655","baseVita":true},"B24":{"nome":"Perloz","km":"154","dislivelloAccumulato":"10287","baseVita":false},"B25":{"nome":"Sassa","km":"161","dislivelloAccumulato":"11095","baseVita":false},"B26":{"nome":"Rifugio Coda","km":"165","dislivelloAccumulato":"12014","baseVita":false},"B27":{"nome":"Lago Vargno","km":"172","dislivelloAccumulato":"12014","baseVita":false},"B28":{"nome":"Lago Chiaro","km":"178","dislivelloAccumulato":"12214","baseVita":false},"B29":{"nome":"Colle Vecchia","km":"181","dislivelloAccumulato":"12414","baseVita":false},"B30":{"nome":"Niel","km":"186","dislivelloAccumulato":"12655","baseVita":false},"B31":{"nome":"Loo","km":"191","dislivelloAccumulato":"13487","baseVita":false},"B32":{"nome":"Gressoney IN","km":"200","dislivelloAccumulato":"13847","baseVita":true},"B33":{"nome":"Gressoney OUT","km":"200","dislivelloAccumulato":"13847","baseVita":true},"B34":{"nome":"Alpenzu","km":"207","dislivelloAccumulato":"14004","baseVita":false},"B35":{"nome":"Crest","km":"210","dislivelloAccumulato":"15004","baseVita":false},"B36":{"nome":"Saint Jacques","km":"222","dislivelloAccumulato":"15128","baseVita":false},"B37":{"nome":"Tournalin","km":"226","dislivelloAccumulato":"15828","baseVita":false},"B38":{"nome":"Valtournenche IN","km":"236","dislivelloAccumulato":"16248","baseVita":true},"B39":{"nome":"Valtournenche OUT","km":"236","dislivelloAccumulato":"16248","baseVita":true},"B40":{"nome":"Barmasse","km":"249","dislivelloAccumulato":"16848","baseVita":false},"B41":{"nome":"Vareton","km":"250","dislivelloAccumulato":"17340","baseVita":false},"B42":{"nome":"Reboulaz","km":"252","dislivelloAccumulato":"17842","baseVita":false},"B43":{"nome":"Cuney","km":"256","dislivelloAccumulato":"18173","baseVita":false},"B44":{"nome":"Clermont","km":"260","dislivelloAccumulato":"18173","baseVita":false},"B45":{"nome":"Oyace","km":"270","dislivelloAccumulato":"18607","baseVita":false},"B46":{"nome":"Bruson Arp","km":"274","dislivelloAccumulato":"19207","baseVita":false},"B47":{"nome":"Bruson Colle","km":"276","dislivelloAccumulato":"19652","baseVita":false},"B48":{"nome":"Berio","km":"278","dislivelloAccumulato":"19652","baseVita":false},"B49":{"nome":"Ollomont IN","km":"283","dislivelloAccumulato":"19652","baseVita":true},"B50":{"nome":"Ollomont OUT","km":"283","dislivelloAccumulato":"19652","baseVita":true},"B51":{"nome":"Champillon","km":"288","dislivelloAccumulato":"20963","baseVita":false},"B52":{"nome":"Ponteille","km":"292","dislivelloAccumulato":"20963","baseVita":false},"B53":{"nome":"Bosses","km":"303","dislivelloAccumulato":"21104","baseVita":false},"B54":{"nome":"Frassati","km":"314","dislivelloAccumulato":"22304","baseVita":false},"B55":{"nome":"Bonatti","km":"321","dislivelloAccumulato":"23114","baseVita":false},"B56":{"nome":"Bertone","km":"328","dislivelloAccumulato":"23214","baseVita":false},"B57":{"nome":"Arrivo","km":"332","dislivelloAccumulato":"23300","baseVita":false}}
  dataRunners = {"1":{"pettorale":"1","nome":"COLLE FRANCO","nazione":"IT","anagrafica.Sesso":"M"},"3":{"pettorale":"3","nome":"LE SAUX CHRISTOPHE","nazione":"FR","anagrafica.Sesso":"M"},"5":{"pettorale":"5","nome":"ONO MASAHIRO","nazione":"JP","anagrafica.Sesso":"M"},"6":{"pettorale":"6","nome":"DOHERTY DAN","nazione":"IE","anagrafica.Sesso":"M"},"7":{"pettorale":"7","nome":"GALEATI GIANLUCA","nazione":"IT","anagrafica.Sesso":"M"},"10":{"pettorale":"10","nome":"ANNOVAZZI GIANCARLO","nazione":"IT","anagrafica.Sesso":"M"},"12":{"pettorale":"12","nome":"MUSAZZI SIMONE","nazione":"IT","anagrafica.Sesso":"M"},"14":{"pettorale":"14","nome":"Viola Enrico","nazione":"IT","anagrafica.Sesso":"M"},"15":{"pettorale":"15","nome":"KEITH EOIN","nazione":"IE","anagrafica.Sesso":"M"},"16":{"pettorale":"16","nome":"Arro&#039; Luca","nazione":"IT","anagrafica.Sesso":"M"},"22":{"pettorale":"22","nome":"BORZANI LISA","nazione":"IT","anagrafica.Sesso":"F"},"26":{"pettorale":"26","nome":"GUERINI LUCA","nazione":"IT","anagrafica.Sesso":"M"},"30":{"pettorale":"30","nome":"GIDEON ZADOKS","nazione":"NL","anagrafica.Sesso":"M"},"32":{"pettorale":"32","nome":"ZIMMERMANN DENISE","nazione":"CH","anagrafica.Sesso":"F"},"46":{"pettorale":"46","nome":"PLAVAN MARINA","nazione":"IT","anagrafica.Sesso":"F"},"49":{"pettorale":"49","nome":"yamada takashi","nazione":"JP","anagrafica.Sesso":"M"},"50":{"pettorale":"50","nome":"PUIT JAVIER","nazione":"ES","anagrafica.Sesso":"M"},"52":{"pettorale":"52","nome":"STEGAGNINI LUCA","nazione":"IT","anagrafica.Sesso":"M"},"55":{"pettorale":"55","nome":"PFEND StÃ©phane","nazione":"FR","anagrafica.Sesso":"M"},"61":{"pettorale":"61","nome":"COLLE MASSIMO","nazione":"IT","anagrafica.Sesso":"M"},"64":{"pettorale":"64","nome":"PIERRE HENRI JOUNEAU","nazione":"FR","anagrafica.Sesso":"M"},"72":{"pettorale":"72","nome":"lambin claude","nazione":"BE","anagrafica.Sesso":"M"},"83":{"pettorale":"83","nome":"FLORENT MAIRE","nazione":"FR","anagrafica.Sesso":"M"},"92":{"pettorale":"92","nome":"LANDRESSE CHRISTIAN","nazione":"LU","anagrafica.Sesso":"M"},"93":{"pettorale":"93","nome":"FORTMANN MARGARETHA","nazione":"AU","anagrafica.Sesso":"F"},"94":{"pettorale":"94","nome":"ORLANDO PIETRO","nazione":"IT","anagrafica.Sesso":"M"},"99":{"pettorale":"99","nome":"BALSAMO LUISA","nazione":"IT","anagrafica.Sesso":"F"},"102":{"pettorale":"102","nome":"REZOLA UROLA KAULDI","nazione":"ES","anagrafica.Sesso":"M"},"104":{"pettorale":"104","nome":"SIMARD ARNAUD","nazione":"FR","anagrafica.Sesso":"M"},"107":{"pettorale":"107","nome":"JOUFFROY ROMAIN","nazione":"FR","anagrafica.Sesso":"M"},"111":{"pettorale":"111","nome":"MANEGLIA ANDREA","nazione":"IT","anagrafica.Sesso":"M"},"115":{"pettorale":"115","nome":"Pica Massimo","nazione":"IT","anagrafica.Sesso":"M"},"124":{"pettorale":"124","nome":"ROVELLI ROBERTO","nazione":"IT","anagrafica.Sesso":"M"},"125":{"pettorale":"125","nome":"GIRGIN SERKAN","nazione":"TR","anagrafica.Sesso":"M"},"126":{"pettorale":"126","nome":"GIRGIN SERTAN","nazione":"TR","anagrafica.Sesso":"M"},"132":{"pettorale":"132","nome":"BEGO LIONELLO","nazione":"IT","anagrafica.Sesso":"M"},"133":{"pettorale":"133","nome":"THIBAULT STEPHANIE","nazione":"FR","anagrafica.Sesso":"F"},"134":{"pettorale":"134","nome":"BLONDEAU THIERRY","nazione":"FR","anagrafica.Sesso":"M"},"136":{"pettorale":"136","nome":"MONTEFERRARIO DARIO","nazione":"IT","anagrafica.Sesso":"M"},"138":{"pettorale":"138","nome":"BENVENUTO ENZO","nazione":"IT","anagrafica.Sesso":"M"},"139":{"pettorale":"139","nome":"PAOLO BIONDO","nazione":"NC","anagrafica.Sesso":"M"},"145":{"pettorale":"145","nome":"PETERSEN HEINE","nazione":"DK","anagrafica.Sesso":"M"},"150":{"pettorale":"150","nome":"LESTAK PETER","nazione":"SK","anagrafica.Sesso":"M"},"151":{"pettorale":"151","nome":"de CHIVRÃ© DENIS","nazione":"FR","anagrafica.Sesso":"M"},"153":{"pettorale":"153","nome":"OLIVSON OLEKSANDR","nazione":"UA","anagrafica.Sesso":"M"},"154":{"pettorale":"154","nome":"Borgesio Cristina","nazione":"IT","anagrafica.Sesso":"F"},"157":{"pettorale":"157","nome":"RAMOS MARIO","nazione":"PE","anagrafica.Sesso":"M"},"160":{"pettorale":"160","nome":"MARCHI Arnaud","nazione":"FR","anagrafica.Sesso":"M"},"179":{"pettorale":"179","nome":"BILLET MIRKO ANGELO","nazione":"IT","anagrafica.Sesso":"M"},"184":{"pettorale":"184","nome":"FORESTIERI ALEXANDRE","nazione":"FR","anagrafica.Sesso":"M"},"187":{"pettorale":"187","nome":"DALLA VECCHIA DANIELE","nazione":"IT","anagrafica.Sesso":"M"},"196":{"pettorale":"196","nome":"JACQMIN NATHANAÃ«L","nazione":"BE","anagrafica.Sesso":"M"},"201":{"pettorale":"201","nome":"MACCHI ANDREA","nazione":"IT","anagrafica.Sesso":"M"},"204":{"pettorale":"204","nome":"MACCHIAVELLO GIORGIO","nazione":"IT","anagrafica.Sesso":"M"},"213":{"pettorale":"213","nome":"LUBOZ ATTILIO","nazione":"IT","anagrafica.Sesso":"M"},"217":{"pettorale":"217","nome":"Zardini Matteo","nazione":"IT","anagrafica.Sesso":"M"},"221":{"pettorale":"221","nome":"ascenzi sergio","nazione":"IT","anagrafica.Sesso":"M"},"225":{"pettorale":"225","nome":"NIKOLIC PREDRAG","nazione":"HR","anagrafica.Sesso":"M"},"229":{"pettorale":"229","nome":"Da Forno Dario","nazione":"IT","anagrafica.Sesso":"M"},"233":{"pettorale":"233","nome":"BONANDRINI PAOLO","nazione":"IT","anagrafica.Sesso":"M"},"234":{"pettorale":"234","nome":"LA ROCCA GIOVANNI","nazione":"IT","anagrafica.Sesso":"M"},"254":{"pettorale":"254","nome":"GORLERO RICCARDO","nazione":"IT","anagrafica.Sesso":"M"},"262":{"pettorale":"262","nome":"DUCLAIR ROBERTO","nazione":"IT","anagrafica.Sesso":"M"},"265":{"pettorale":"265","nome":"WANG XIAOLIN","nazione":"CN","anagrafica.Sesso":"M"},"266":{"pettorale":"266","nome":"TALLIA CHIARA","nazione":"IT","anagrafica.Sesso":"F"},"271":{"pettorale":"271","nome":"PAPADOPOULOS MICHAIL","nazione":"GR","anagrafica.Sesso":"M"},"278":{"pettorale":"278","nome":"MICHELETTI LUCIANO","nazione":"IT","anagrafica.Sesso":"M"},"297":{"pettorale":"297","nome":"MERCALLI LUCA","nazione":"IT","anagrafica.Sesso":"M"},"299":{"pettorale":"299","nome":"SERRAJOTTO MARINO","nazione":"IT","anagrafica.Sesso":"M"},"303":{"pettorale":"303","nome":"JEGERLEHNER BEAT","nazione":"US","anagrafica.Sesso":"M"},"307":{"pettorale":"307","nome":"COMUNE PAOLO","nazione":"IT","anagrafica.Sesso":"M"},"309":{"pettorale":"309","nome":"FILIPPA ALESSIA MARIA","nazione":"IT","anagrafica.Sesso":"F"},"318":{"pettorale":"318","nome":"WERNECK FRED","nazione":"CH","anagrafica.Sesso":"M"},"323":{"pettorale":"323","nome":"ADRIAN MARIUS TOMA","nazione":"RO","anagrafica.Sesso":"M"},"328":{"pettorale":"328","nome":"LUC HENNUS","nazione":"BE","anagrafica.Sesso":"M"},"329":{"pettorale":"329","nome":"TRIBOLO PHILIPPE","nazione":"FR","anagrafica.Sesso":"M"},"332":{"pettorale":"332","nome":"BRAUN Max","nazione":"FR","anagrafica.Sesso":"M"},"340":{"pettorale":"340","nome":"BOUTEILLE Christian","nazione":"FR","anagrafica.Sesso":"M"},"342":{"pettorale":"342","nome":"MILANI MIRKO","nazione":"IT","anagrafica.Sesso":"M"},"346":{"pettorale":"346","nome":"PATIERNO  GENNARO","nazione":"IT","anagrafica.Sesso":"M"},"348":{"pettorale":"348","nome":"GARIN FILIPPO","nazione":"IT","anagrafica.Sesso":"M"},"354":{"pettorale":"354","nome":"ISERNIA RUGGIERO","nazione":"IT","anagrafica.Sesso":"M"},"355":{"pettorale":"355","nome":"VARADAS ILIAS","nazione":"GR","anagrafica.Sesso":"M"},"360":{"pettorale":"360","nome":"MARANGON ROBERTO","nazione":"IT","anagrafica.Sesso":"M"},"363":{"pettorale":"363","nome":"De Guio  Filippo","nazione":"IT","anagrafica.Sesso":"M"},"365":{"pettorale":"365","nome":"SEGURA PABLO","nazione":"ES","anagrafica.Sesso":"M"},"373":{"pettorale":"373","nome":"Mosca stefano","nazione":"IT","anagrafica.Sesso":"M"},"374":{"pettorale":"374","nome":"SANDRINE TAISSON","nazione":"FR","anagrafica.Sesso":"F"},"375":{"pettorale":"375","nome":"TOMATIS PAOLO","nazione":"IT","anagrafica.Sesso":"M"},"381":{"pettorale":"381","nome":"PENOV VLADIMIR","nazione":"BG","anagrafica.Sesso":"M"},"386":{"pettorale":"386","nome":"LOPARDO PAULA LUCIA","nazione":"AR","anagrafica.Sesso":"F"},"389":{"pettorale":"389","nome":"TSANG WOON MING","nazione":"HK","anagrafica.Sesso":"F"},"401":{"pettorale":"401","nome":"NOOTENBOOM SHIRLEY","nazione":"NL","anagrafica.Sesso":"F"},"408":{"pettorale":"408","nome":"MAZZUCHI FEDERICO","nazione":"IT","anagrafica.Sesso":"M"},"409":{"pettorale":"409","nome":"ZOMER FRANCO","nazione":"IT","anagrafica.Sesso":"M"},"411":{"pettorale":"411","nome":"MONTI MAURIZIO","nazione":"IT","anagrafica.Sesso":"M"},"412":{"pettorale":"412","nome":"MARTÃ­N OSKAR","nazione":"ES","anagrafica.Sesso":"M"},"417":{"pettorale":"417","nome":"BRUNAZZI CARLO UMBERTO","nazione":"DE","anagrafica.Sesso":"M"},"426":{"pettorale":"426","nome":"ROBERTS PHILIPPE","nazione":"GB","anagrafica.Sesso":"M"},"427":{"pettorale":"427","nome":"KAPINÄŒIK IVAN","nazione":"LT","anagrafica.Sesso":"M"},"431":{"pettorale":"431","nome":"TRUCCO ERMES","nazione":"IT","anagrafica.Sesso":"M"},"434":{"pettorale":"434","nome":"CORTI LAURA","nazione":"IT","anagrafica.Sesso":"F"},"501":{"pettorale":"501","nome":"PHILIPPE GERVILLE","nazione":"RE","anagrafica.Sesso":"M"},"502":{"pettorale":"502","nome":"LANTERMOZ ADOLFO","nazione":"IT","anagrafica.Sesso":"M"},"503":{"pettorale":"503","nome":"Goggi Francesco","nazione":"IT","anagrafica.Sesso":"M"},"504":{"pettorale":"504","nome":"ABBEY GABRIEL","nazione":"FR","anagrafica.Sesso":"M"},"505":{"pettorale":"505","nome":"Watkins Natalia","nazione":"HK","anagrafica.Sesso":"F"},"506":{"pettorale":"506","nome":"ALAIN PARIS","nazione":"FR","anagrafica.Sesso":"M"},"507":{"pettorale":"507","nome":"MichaÃ«l NanÃ§oz","nazione":"CH","anagrafica.Sesso":"M"},"508":{"pettorale":"508","nome":"Rowe Steven","nazione":"FR","anagrafica.Sesso":"M"},"509":{"pettorale":"509","nome":"SORS Michel","nazione":"FR","anagrafica.Sesso":"M"},"510":{"pettorale":"510","nome":"moog paul","nazione":"FR","anagrafica.Sesso":"M"},"511":{"pettorale":"511","nome":"Spurlock Dan","nazione":"US","anagrafica.Sesso":"M"},"512":{"pettorale":"512","nome":"Lazier Pierre","nazione":"IT","anagrafica.Sesso":"M"},"513":{"pettorale":"513","nome":"PEROZO MOSQUERO MANUEL","nazione":"ES","anagrafica.Sesso":"M"},"514":{"pettorale":"514","nome":"JOLY YANNICK","nazione":"IT","anagrafica.Sesso":"M"},"515":{"pettorale":"515","nome":"GAUTHIER Dominique","nazione":"FR","anagrafica.Sesso":"M"},"516":{"pettorale":"516","nome":"Lawrence Thaddeus","nazione":"SG","anagrafica.Sesso":"M"},"517":{"pettorale":"517","nome":"papi luca","nazione":"FR","anagrafica.Sesso":"M"},"518":{"pettorale":"518","nome":"Nicolas MOYROUD","nazione":"FR","anagrafica.Sesso":"M"},"519":{"pettorale":"519","nome":"Eric Senges","nazione":"FR","anagrafica.Sesso":"M"},"520":{"pettorale":"520","nome":"Tagliabue Alberto","nazione":"IT","anagrafica.Sesso":"M"},"521":{"pettorale":"521","nome":"Gerard Antonio","nazione":"IT","anagrafica.Sesso":"M"},"522":{"pettorale":"522","nome":"SUZUKI MASAYUKI","nazione":"JP","anagrafica.Sesso":"M"},"523":{"pettorale":"523","nome":"TANAKA TAROU","nazione":"JP","anagrafica.Sesso":"M"},"524":{"pettorale":"524","nome":"GUAN YADI","nazione":"CN","anagrafica.Sesso":"M"},"525":{"pettorale":"525","nome":"ROTHAN BenoÃ®t","nazione":"RE","anagrafica.Sesso":"M"},"526":{"pettorale":"526","nome":"Kubo Akiko","nazione":"JP","anagrafica.Sesso":"F"},"527":{"pettorale":"527","nome":"Roux Georges","nazione":"FR","anagrafica.Sesso":"M"},"528":{"pettorale":"528","nome":"Davico Claudio","nazione":"CL","anagrafica.Sesso":"M"},"529":{"pettorale":"529","nome":"BERGUET PATRIC","nazione":"IT","anagrafica.Sesso":"M"},"530":{"pettorale":"530","nome":"SCHERZER STEFAN","nazione":"DE","anagrafica.Sesso":"M"},"531":{"pettorale":"531","nome":"Bourcier Franck","nazione":"FR","anagrafica.Sesso":"M"},"532":{"pettorale":"532","nome":"tamargo valdes Joel","nazione":"ES","anagrafica.Sesso":"M"},"533":{"pettorale":"533","nome":"SOLARI PAOLO","nazione":"CL","anagrafica.Sesso":"M"},"534":{"pettorale":"534","nome":"David RAHIER","nazione":"BE","anagrafica.Sesso":"M"},"535":{"pettorale":"535","nome":"Suzuki Junko","nazione":"JP","anagrafica.Sesso":"F"},"536":{"pettorale":"536","nome":"enome keiichi","nazione":"JP","anagrafica.Sesso":"M"},"537":{"pettorale":"537","nome":"jean-noÃ«l Cretin","nazione":"FR","anagrafica.Sesso":"M"},"538":{"pettorale":"538","nome":"Mangin Christophe","nazione":"FR","anagrafica.Sesso":"M"},"539":{"pettorale":"539","nome":"Christophe Ligeon-ligeonnet","nazione":"FR","anagrafica.Sesso":"M"},"540":{"pettorale":"540","nome":"Bernardoni stefano","nazione":"CH","anagrafica.Sesso":"M"},"541":{"pettorale":"541","nome":"Eric MOINE","nazione":"FR","anagrafica.Sesso":"M"},"542":{"pettorale":"542","nome":"BARBIER DANIEL","nazione":"FR","anagrafica.Sesso":"M"},"543":{"pettorale":"543","nome":"BARBIER EMMANUEL","nazione":"FR","anagrafica.Sesso":"M"},"544":{"pettorale":"544","nome":"Townsend Mark","nazione":"GB","anagrafica.Sesso":"M"},"545":{"pettorale":"545","nome":"Gyppaz Diego","nazione":"IT","anagrafica.Sesso":"M"},"546":{"pettorale":"546","nome":"Emmanuel Foudrinier","nazione":"FR","anagrafica.Sesso":"M"},"547":{"pettorale":"547","nome":"ghislaine GALLE","nazione":"FR","anagrafica.Sesso":"F"},"548":{"pettorale":"548","nome":"DUFOUR Christophe","nazione":"GP","anagrafica.Sesso":"M"},"549":{"pettorale":"549","nome":"LindstrÃ¶m Tobias","nazione":"SE","anagrafica.Sesso":"M"},"550":{"pettorale":"550","nome":"Serge Lefebvre","nazione":"FR","anagrafica.Sesso":"M"},"551":{"pettorale":"551","nome":"Pession Jordan","nazione":"IT","anagrafica.Sesso":"M"},"552":{"pettorale":"552","nome":"Quagliaroli Paolo","nazione":"IT","anagrafica.Sesso":"M"},"553":{"pettorale":"553","nome":"LELOUCHE  Bernard","nazione":"FR","anagrafica.Sesso":"M"},"554":{"pettorale":"554","nome":"Quagliaroli Michele","nazione":"IT","anagrafica.Sesso":"M"},"555":{"pettorale":"555","nome":"Kratter Massimiliano","nazione":"IT","anagrafica.Sesso":"M"},"556":{"pettorale":"556","nome":"jimenez estebanez israel","nazione":"ES","anagrafica.Sesso":"M"},"557":{"pettorale":"557","nome":"Chris Marolf","nazione":"CH","anagrafica.Sesso":"M"},"558":{"pettorale":"558","nome":"Burtolo  Christian ","nazione":"IT","anagrafica.Sesso":"M"},"559":{"pettorale":"559","nome":"Magni Jarno","nazione":"IT","anagrafica.Sesso":"M"},"560":{"pettorale":"560","nome":"Schreiner Christian","nazione":"DE","anagrafica.Sesso":"M"},"561":{"pettorale":"561","nome":"Almansa Alberto","nazione":"ES","anagrafica.Sesso":"M"},"562":{"pettorale":"562","nome":"Pereira Miguel","nazione":"PT","anagrafica.Sesso":"M"},"563":{"pettorale":"563","nome":"Gao Qing","nazione":"CN","anagrafica.Sesso":"M"},"564":{"pettorale":"564","nome":"kocha katsumi","nazione":"JP","anagrafica.Sesso":"M"},"565":{"pettorale":"565","nome":"Solomakhin Dmitry","nazione":"GB","anagrafica.Sesso":"M"},"566":{"pettorale":"566","nome":"Wee Teck Hian","nazione":"SG","anagrafica.Sesso":"M"},"567":{"pettorale":"567","nome":"TACHIBANA NORIKO","nazione":"JP","anagrafica.Sesso":"F"},"568":{"pettorale":"568","nome":"Zdon William","nazione":"US","anagrafica.Sesso":"M"},"569":{"pettorale":"569","nome":"miura kouji","nazione":"JP","anagrafica.Sesso":"M"},"570":{"pettorale":"570","nome":"Lin Haidan","nazione":"CN","anagrafica.Sesso":"M"},"571":{"pettorale":"571","nome":"Wang Zongfa","nazione":"CN","anagrafica.Sesso":"M"},"572":{"pettorale":"572","nome":"LI JIANG","nazione":"CN","anagrafica.Sesso":"M"},"573":{"pettorale":"573","nome":"QUINTANILLA VALERO MANEL","nazione":"ES","anagrafica.Sesso":"M"},"574":{"pettorale":"574","nome":"Vioud jerome","nazione":"FR","anagrafica.Sesso":"M"},"575":{"pettorale":"575","nome":"Prochazkova Pavlina","nazione":"CZ","anagrafica.Sesso":"F"},"576":{"pettorale":"576","nome":"Simenyi Miklos","nazione":"HU","anagrafica.Sesso":"M"},"577":{"pettorale":"577","nome":"Victor RICHARD","nazione":"BE","anagrafica.Sesso":"M"},"578":{"pettorale":"578","nome":"Orsenigo Roberta","nazione":"IT","anagrafica.Sesso":"F"},"579":{"pettorale":"579","nome":"Jean luc Maroquin","nazione":"NC","anagrafica.Sesso":"M"},"580":{"pettorale":"580","nome":"Ubertino Alberto","nazione":"IT","anagrafica.Sesso":"M"},"581":{"pettorale":"581","nome":"Artan Ayhan","nazione":"CH","anagrafica.Sesso":"M"},"582":{"pettorale":"582","nome":"MARTYNEK IVAN","nazione":"SK","anagrafica.Sesso":"M"},"583":{"pettorale":"583","nome":"borgioli Valentina","nazione":"IT","anagrafica.Sesso":"F"},"584":{"pettorale":"584","nome":"Pierre Lacombe","nazione":"FR","anagrafica.Sesso":"M"},"585":{"pettorale":"585","nome":"Nuccio Ermanno","nazione":"IT","anagrafica.Sesso":"M"},"586":{"pettorale":"586","nome":"CHIESA ALBERTO","nazione":"IT","anagrafica.Sesso":"M"},"587":{"pettorale":"587","nome":"Zanoli Monica","nazione":"BR","anagrafica.Sesso":"F"},"588":{"pettorale":"588","nome":"KILEN DAG","nazione":"NO","anagrafica.Sesso":"M"},"589":{"pettorale":"589","nome":"Fischer Marc","nazione":"CH","anagrafica.Sesso":"M"},"590":{"pettorale":"590","nome":"Poretti Marta","nazione":"IT","anagrafica.Sesso":"F"},"591":{"pettorale":"591","nome":"daniel LE GARS","nazione":"MG","anagrafica.Sesso":"M"},"592":{"pettorale":"592","nome":"chevalley olivier","nazione":"FR","anagrafica.Sesso":"M"},"593":{"pettorale":"593","nome":"Killian GARNIER","nazione":"FR","anagrafica.Sesso":"M"},"594":{"pettorale":"594","nome":"Sponchiado Filippo","nazione":"IT","anagrafica.Sesso":"M"},"595":{"pettorale":"595","nome":"CIOCCA MARCO","nazione":"IT","anagrafica.Sesso":"M"},"596":{"pettorale":"596","nome":"CAROLINE CAUMON","nazione":"FR","anagrafica.Sesso":"F"},"597":{"pettorale":"597","nome":"pession valentino","nazione":"IT","anagrafica.Sesso":"M"},"598":{"pettorale":"598","nome":"ROCCHI VALERIO","nazione":"IT","anagrafica.Sesso":"M"},"599":{"pettorale":"599","nome":"perrone capano marco","nazione":"IT","anagrafica.Sesso":"M"},"600":{"pettorale":"600","nome":"Mialocq Pierre","nazione":"FR","anagrafica.Sesso":"M"},"601":{"pettorale":"601","nome":"Oreiller David","nazione":"IT","anagrafica.Sesso":"M"},"602":{"pettorale":"602","nome":"Arribot Laure","nazione":"FR","anagrafica.Sesso":"F"},"603":{"pettorale":"603","nome":"Bosio Claudine","nazione":"FR","anagrafica.Sesso":"F"},"604":{"pettorale":"604","nome":"roger jouin","nazione":"BE","anagrafica.Sesso":"M"},"605":{"pettorale":"605","nome":"luciani giorgio","nazione":"IT","anagrafica.Sesso":"M"},"606":{"pettorale":"606","nome":"Hruby Petr","nazione":"CZ","anagrafica.Sesso":"M"},"607":{"pettorale":"607","nome":"franciosi jonathan","nazione":"IT","anagrafica.Sesso":"M"},"608":{"pettorale":"608","nome":"mattio adriano","nazione":"IT","anagrafica.Sesso":"M"},"609":{"pettorale":"609","nome":"FERNANDEZ FERNANDEZ GONZALO","nazione":"ES","anagrafica.Sesso":"M"},"610":{"pettorale":"610","nome":"LACROIX Michel","nazione":"FR","anagrafica.Sesso":"M"},"611":{"pettorale":"611","nome":"PAÃNIGRA JACQUES","nazione":"FR","anagrafica.Sesso":"M"},"612":{"pettorale":"612","nome":"METRAL DIDIER","nazione":"FR","anagrafica.Sesso":"M"},"613":{"pettorale":"613","nome":"Martini Massimo","nazione":"IT","anagrafica.Sesso":"M"},"614":{"pettorale":"614","nome":"PERFUMO RENZO","nazione":"IT","anagrafica.Sesso":"M"},"615":{"pettorale":"615","nome":"Jiang An","nazione":"CN","anagrafica.Sesso":"M"},"616":{"pettorale":"616","nome":"PANDOLFI ANDREA DEDA","nazione":"IT","anagrafica.Sesso":"M"},"617":{"pettorale":"617","nome":"Samaniego Montero Jose","nazione":"ES","anagrafica.Sesso":"M"},"618":{"pettorale":"618","nome":"Amadio Fabrizio","nazione":"IT","anagrafica.Sesso":"M"},"619":{"pettorale":"619","nome":"Bokov Vasily","nazione":"UA","anagrafica.Sesso":"M"},"620":{"pettorale":"620","nome":"Herren Solange","nazione":"IT","anagrafica.Sesso":"F"},"621":{"pettorale":"621","nome":"brussolo simone","nazione":"IT","anagrafica.Sesso":"M"},"622":{"pettorale":"622","nome":"paoloni roberto","nazione":"IT","anagrafica.Sesso":"M"},"623":{"pettorale":"623","nome":"Wagner Wolfgang","nazione":"DE","anagrafica.Sesso":"M"},"624":{"pettorale":"624","nome":"GOSETTI CLAUDIO","nazione":"IT","anagrafica.Sesso":"M"},"625":{"pettorale":"625","nome":"Allan Kim","nazione":"NZ","anagrafica.Sesso":"F"},"626":{"pettorale":"626","nome":"Serra HernÃ¡ndez Francisco","nazione":"ES","anagrafica.Sesso":"M"},"627":{"pettorale":"627","nome":"Domnin ERARD","nazione":"FR","anagrafica.Sesso":"M"},"628":{"pettorale":"628","nome":"VIOT VALTER","nazione":"IT","anagrafica.Sesso":"M"},"629":{"pettorale":"629","nome":"sacanna massimo","nazione":"IT","anagrafica.Sesso":"M"},"630":{"pettorale":"630","nome":"MENÃ‰NDEZ SUÃREZ ALEJANDRO","nazione":"ES","anagrafica.Sesso":"M"},"631":{"pettorale":"631","nome":"Martin Michel","nazione":"CH","anagrafica.Sesso":"M"},"632":{"pettorale":"632","nome":"Ottobon Davis","nazione":"IT","anagrafica.Sesso":"M"},"633":{"pettorale":"633","nome":"Catherine Lanson","nazione":"FR","anagrafica.Sesso":"F"},"634":{"pettorale":"634","nome":"Ros GaspÃ  Xavi","nazione":"ES","anagrafica.Sesso":"M"},"635":{"pettorale":"635","nome":"Laurent Bourguignon","nazione":"BE","anagrafica.Sesso":"M"},"636":{"pettorale":"636","nome":"BASTRENTAZ ANDREA","nazione":"IT","anagrafica.Sesso":"M"},"637":{"pettorale":"637","nome":"POLO ALDO","nazione":"IT","anagrafica.Sesso":"M"},"638":{"pettorale":"638","nome":"torrens marin guillem","nazione":"ES","anagrafica.Sesso":"M"},"639":{"pettorale":"639","nome":"gallizioli andrea","nazione":"IT","anagrafica.Sesso":"M"},"640":{"pettorale":"640","nome":"BILLI FRANCESCA","nazione":"IT","anagrafica.Sesso":"F"},"641":{"pettorale":"641","nome":"Lavie Jean-marc","nazione":"FR","anagrafica.Sesso":"M"},"642":{"pettorale":"642","nome":"MAINARDI FRANCESCO","nazione":"IT","anagrafica.Sesso":"M"},"643":{"pettorale":"643","nome":"MARTÃNEZ RUFETE DANIEL","nazione":"ES","anagrafica.Sesso":"M"},"644":{"pettorale":"644","nome":"denis LAURET","nazione":"FR","anagrafica.Sesso":"M"},"645":{"pettorale":"645","nome":"spazzadeschi riccardo","nazione":"IT","anagrafica.Sesso":"M"},"646":{"pettorale":"646","nome":"CUCCHI SERGIO","nazione":"IT","anagrafica.Sesso":"M"},"647":{"pettorale":"647","nome":"Davis Matthew","nazione":"GB","anagrafica.Sesso":"M"},"648":{"pettorale":"648","nome":"Antonov Bozhidar","nazione":"BG","anagrafica.Sesso":"M"},"649":{"pettorale":"649","nome":"Di Giannantonio Gianluca","nazione":"IT","anagrafica.Sesso":"M"},"650":{"pettorale":"650","nome":"Caldera Pier Paolo","nazione":"IT","anagrafica.Sesso":"M"},"651":{"pettorale":"651","nome":"Wagner Thomas","nazione":"DE","anagrafica.Sesso":"M"},"652":{"pettorale":"652","nome":"Repetto Danilo","nazione":"IT","anagrafica.Sesso":"M"},"653":{"pettorale":"653","nome":"Valsesia Max","nazione":"IT","anagrafica.Sesso":"M"},"654":{"pettorale":"654","nome":"Shen Ying Min","nazione":"CN","anagrafica.Sesso":"M"},"655":{"pettorale":"655","nome":"BIC YURI","nazione":"IT","anagrafica.Sesso":"M"},"656":{"pettorale":"656","nome":"CHAMOUX Jerome","nazione":"FR","anagrafica.Sesso":"M"},"657":{"pettorale":"657","nome":"patrocle stefano","nazione":"IT","anagrafica.Sesso":"M"},"658":{"pettorale":"658","nome":"Ng Seow Kong","nazione":"MY","anagrafica.Sesso":"M"},"659":{"pettorale":"659","nome":"Cojutti Luca","nazione":"IT","anagrafica.Sesso":"M"},"660":{"pettorale":"660","nome":"PUJAL CARABANTES PEP","nazione":"AD","anagrafica.Sesso":"M"},"661":{"pettorale":"661","nome":"Higuchi Hiroyuki","nazione":"JP","anagrafica.Sesso":"M"},"662":{"pettorale":"662","nome":"MILAZZO ANGELO","nazione":"IT","anagrafica.Sesso":"M"},"663":{"pettorale":"663","nome":"Dr. Hentsch Torsten","nazione":"DE","anagrafica.Sesso":"M"},"664":{"pettorale":"664","nome":"CARUSO MARCO","nazione":"IT","anagrafica.Sesso":"M"},"665":{"pettorale":"665","nome":"guarnieri patrizia","nazione":"IT","anagrafica.Sesso":"F"},"666":{"pettorale":"666","nome":"FRANCOIS NAVARRETTE","nazione":"FR","anagrafica.Sesso":"M"},"667":{"pettorale":"667","nome":"OrrÃº  Andrea vincenzo ","nazione":"IT","anagrafica.Sesso":"M"},"668":{"pettorale":"668","nome":"Piotrowski Maciej","nazione":"PL","anagrafica.Sesso":"M"},"669":{"pettorale":"669","nome":"CHATRIAN MATTEO","nazione":"IT","anagrafica.Sesso":"M"},"670":{"pettorale":"670","nome":"Clerici Angelo","nazione":"IT","anagrafica.Sesso":"M"},"671":{"pettorale":"671","nome":"GRIMAUD FREDERIC","nazione":"FR","anagrafica.Sesso":"M"},"672":{"pettorale":"672","nome":"fondra Duilio","nazione":"IT","anagrafica.Sesso":"M"},"673":{"pettorale":"673","nome":"Poloni Lucia","nazione":"IT","anagrafica.Sesso":"F"},"674":{"pettorale":"674","nome":"ludovic martin","nazione":"FR","anagrafica.Sesso":"M"},"675":{"pettorale":"675","nome":"Carraro walter","nazione":"IT","anagrafica.Sesso":"M"},"676":{"pettorale":"676","nome":"Sroka Wojtek","nazione":"PL","anagrafica.Sesso":"M"},"677":{"pettorale":"677","nome":"Leon Daniel","nazione":"FR","anagrafica.Sesso":"M"},"678":{"pettorale":"678","nome":"Rumyantseva Evgeniya","nazione":"RU","anagrafica.Sesso":"F"},"679":{"pettorale":"679","nome":"Meynet Valerie","nazione":"CH","anagrafica.Sesso":"F"},"680":{"pettorale":"680","nome":"LANARI YOSELITO","nazione":"IT","anagrafica.Sesso":"M"},"681":{"pettorale":"681","nome":"dealberto clara","nazione":"IT","anagrafica.Sesso":"F"},"682":{"pettorale":"682","nome":"Mathieu SIRAUDIN","nazione":"FR","anagrafica.Sesso":"M"},"683":{"pettorale":"683","nome":"guazzo raffaele","nazione":"IT","anagrafica.Sesso":"M"},"684":{"pettorale":"684","nome":"Verdier Philippe","nazione":"MC","anagrafica.Sesso":"M"},"685":{"pettorale":"685","nome":"Magnin LUCIANO","nazione":"IT","anagrafica.Sesso":"M"},"686":{"pettorale":"686","nome":"Sagastume Juan Carlos","nazione":"GT","anagrafica.Sesso":"M"},"687":{"pettorale":"687","nome":"Tindal Miles","nazione":"CA","anagrafica.Sesso":"M"},"688":{"pettorale":"688","nome":"Bringedal  Jard","nazione":"NO","anagrafica.Sesso":"M"},"689":{"pettorale":"689","nome":"Croatto Fabio","nazione":"IT","anagrafica.Sesso":"M"},"690":{"pettorale":"690","nome":"Hori Akihiro","nazione":"JP","anagrafica.Sesso":"M"},"691":{"pettorale":"691","nome":"Palli Gianluca","nazione":"IT","anagrafica.Sesso":"M"},"692":{"pettorale":"692","nome":"Erik Jacobs","nazione":"NL","anagrafica.Sesso":"M"},"693":{"pettorale":"693","nome":"Patrick Carminati","nazione":"FR","anagrafica.Sesso":"M"},"694":{"pettorale":"694","nome":"TANG FUNG SUN ","nazione":"HK","anagrafica.Sesso":"M"},"695":{"pettorale":"695","nome":"Berger Martin","nazione":"IT","anagrafica.Sesso":"M"},"696":{"pettorale":"696","nome":"Steve Rein","nazione":"CH","anagrafica.Sesso":"M"},"697":{"pettorale":"697","nome":"saccardo carlo","nazione":"IT","anagrafica.Sesso":"M"},"698":{"pettorale":"698","nome":"LI XUESHENG","nazione":"CN","anagrafica.Sesso":"M"},"699":{"pettorale":"699","nome":"Willis Sarah","nazione":"US","anagrafica.Sesso":"F"},"700":{"pettorale":"700","nome":"KRUSEC TADEJA","nazione":"HR","anagrafica.Sesso":"F"},"701":{"pettorale":"701","nome":"frederic oyaga","nazione":"FR","anagrafica.Sesso":"M"},"702":{"pettorale":"702","nome":"BONIN Charles","nazione":"FR","anagrafica.Sesso":"M"},"703":{"pettorale":"703","nome":"CONSONNI RENZO","nazione":"IT","anagrafica.Sesso":"M"},"704":{"pettorale":"704","nome":"CAVALLANTE CLAUDIO","nazione":"IT","anagrafica.Sesso":"M"},"705":{"pettorale":"705","nome":"David Baroni","nazione":"FR","anagrafica.Sesso":"M"},"706":{"pettorale":"706","nome":"Kienzl Peter","nazione":"IT","anagrafica.Sesso":"M"},"707":{"pettorale":"707","nome":"TORELLI CLAUDIO","nazione":"IT","anagrafica.Sesso":"M"},"708":{"pettorale":"708","nome":"Carrel Stefano","nazione":"IT","anagrafica.Sesso":"M"},"709":{"pettorale":"709","nome":"MasÃ³ Sagrera Pere","nazione":"ES","anagrafica.Sesso":"M"},"710":{"pettorale":"710","nome":"Morera Valls Josep Oriol","nazione":"ES","anagrafica.Sesso":"M"},"711":{"pettorale":"711","nome":"franchina cristian","nazione":"IT","anagrafica.Sesso":"M"},"712":{"pettorale":"712","nome":"THIERRY ZANELLA","nazione":"FR","anagrafica.Sesso":"M"},"713":{"pettorale":"713","nome":"Schenkel Gabi","nazione":"CH","anagrafica.Sesso":"F"},"714":{"pettorale":"714","nome":"masnaghetti fabio","nazione":"IT","anagrafica.Sesso":"M"},"715":{"pettorale":"715","nome":"Borgna Irene","nazione":"IT","anagrafica.Sesso":"F"},"716":{"pettorale":"716","nome":"Cavallo Fabio","nazione":"IT","anagrafica.Sesso":"M"},"717":{"pettorale":"717","nome":"Thurman Wes","nazione":"US","anagrafica.Sesso":"M"},"718":{"pettorale":"718","nome":"DENIS BOUTEILLE","nazione":"FR","anagrafica.Sesso":"M"},"719":{"pettorale":"719","nome":"Sweeney Holley","nazione":"NL","anagrafica.Sesso":"F"},"720":{"pettorale":"720","nome":"sweeney kevin","nazione":"NL","anagrafica.Sesso":"M"},"721":{"pettorale":"721","nome":"JEAN-MARC DENES","nazione":"FR","anagrafica.Sesso":"M"},"722":{"pettorale":"722","nome":"Quell Carsten","nazione":"CA","anagrafica.Sesso":"M"},"723":{"pettorale":"723","nome":"Santos Eduardo","nazione":"PT","anagrafica.Sesso":"M"},"724":{"pettorale":"724","nome":"Geza Tamasi","nazione":"HU","anagrafica.Sesso":"M"},"725":{"pettorale":"725","nome":"Thierry Carrade","nazione":"FR","anagrafica.Sesso":"M"},"726":{"pettorale":"726","nome":"Foudon Alida","nazione":"IT","anagrafica.Sesso":"F"},"727":{"pettorale":"727","nome":"Roig Josep","nazione":"AD","anagrafica.Sesso":"M"},"728":{"pettorale":"728","nome":"Fiou Mauro","nazione":"IT","anagrafica.Sesso":"M"},"729":{"pettorale":"729","nome":"OKOBA MIO","nazione":"JP","anagrafica.Sesso":"F"},"730":{"pettorale":"730","nome":"Zanetti  Walter ","nazione":"IT","anagrafica.Sesso":"M"},"731":{"pettorale":"731","nome":"thierry ador","nazione":"FR","anagrafica.Sesso":"M"},"732":{"pettorale":"732","nome":"CASTIGLIONI ALBERTO","nazione":"IT","anagrafica.Sesso":"M"},"733":{"pettorale":"733","nome":"Fink Katja","nazione":"SG","anagrafica.Sesso":"F"},"734":{"pettorale":"734","nome":"SOLIVERA RETCHAS CARLES","nazione":"ES","anagrafica.Sesso":"M"},"735":{"pettorale":"735","nome":"Jones Kingsley","nazione":"GB","anagrafica.Sesso":"M"},"736":{"pettorale":"736","nome":"Dell&#039;Utri Marcella","nazione":"IT","anagrafica.Sesso":"F"},"737":{"pettorale":"737","nome":"Facchin Vittorio","nazione":"IT","anagrafica.Sesso":"M"},"738":{"pettorale":"738","nome":"kusumoto Toshihide","nazione":"JP","anagrafica.Sesso":"M"},"739":{"pettorale":"739","nome":"NOLLY DINO","nazione":"IT","anagrafica.Sesso":"M"},"740":{"pettorale":"740","nome":"eric arveux","nazione":"FR","anagrafica.Sesso":"M"},"741":{"pettorale":"741","nome":"ZAPLETAL AXEL","nazione":"DE","anagrafica.Sesso":"M"},"742":{"pettorale":"742","nome":"Galardini Giovanni","nazione":"IT","anagrafica.Sesso":"M"},"743":{"pettorale":"743","nome":"ERIC TROFFIGUER","nazione":"FR","anagrafica.Sesso":"M"},"744":{"pettorale":"744","nome":"Mora Nicola","nazione":"IT","anagrafica.Sesso":"M"},"745":{"pettorale":"745","nome":"noussan matteo","nazione":"IT","anagrafica.Sesso":"M"},"746":{"pettorale":"746","nome":"Tautscher Hannes","nazione":"AT","anagrafica.Sesso":"M"},"747":{"pettorale":"747","nome":"BARTH Thierry","nazione":"FR","anagrafica.Sesso":"M"},"748":{"pettorale":"748","nome":"HOFFMANN PIERRE","nazione":"FR","anagrafica.Sesso":"M"},"749":{"pettorale":"749","nome":"DAVID MOUSSEAUX","nazione":"FR","anagrafica.Sesso":"M"},"750":{"pettorale":"750","nome":"CAMBIASO EMANUELE","nazione":"IT","anagrafica.Sesso":"M"},"751":{"pettorale":"751","nome":"Ballesteros Victor","nazione":"US","anagrafica.Sesso":"M"},"752":{"pettorale":"752","nome":"Bernini Stefano","nazione":"IT","anagrafica.Sesso":"M"},"753":{"pettorale":"753","nome":"Riva Alessandro","nazione":"IT","anagrafica.Sesso":"M"},"754":{"pettorale":"754","nome":"Michelotti Giuseppe","nazione":"IT","anagrafica.Sesso":"M"},"755":{"pettorale":"755","nome":"Mosconi Corrado","nazione":"IT","anagrafica.Sesso":"M"},"756":{"pettorale":"756","nome":"Jean-Paul Descuves","nazione":"CH","anagrafica.Sesso":"M"},"757":{"pettorale":"757","nome":"Antoine Cina ","nazione":"CH","anagrafica.Sesso":"M"},"758":{"pettorale":"758","nome":"capretti silvio","nazione":"IT","anagrafica.Sesso":"M"},"759":{"pettorale":"759","nome":"mombello cesare","nazione":"IT","anagrafica.Sesso":"M"},"760":{"pettorale":"760","nome":"EÃŸer Michael","nazione":"DE","anagrafica.Sesso":"M"},"761":{"pettorale":"761","nome":"TOMASETTI IVANO","nazione":"IT","anagrafica.Sesso":"M"},"762":{"pettorale":"762","nome":"Ghirelli Eugenio","nazione":"IT","anagrafica.Sesso":"M"},"763":{"pettorale":"763","nome":"Hugill Shane","nazione":"JE","anagrafica.Sesso":"M"},"764":{"pettorale":"764","nome":"Amerio Marco","nazione":"IT","anagrafica.Sesso":"M"},"765":{"pettorale":"765","nome":"Tamone Luca","nazione":"IT","anagrafica.Sesso":"M"},"766":{"pettorale":"766","nome":"Tam man yiu","nazione":"HK","anagrafica.Sesso":"M"},"767":{"pettorale":"767","nome":"Straub Simon","nazione":"AT","anagrafica.Sesso":"M"},"768":{"pettorale":"768","nome":"Ogusu Takeya","nazione":"JP","anagrafica.Sesso":"M"},"769":{"pettorale":"769","nome":"Viska Stefan","nazione":"SE","anagrafica.Sesso":"M"},"770":{"pettorale":"770","nome":"Pramotton Eligio","nazione":"IT","anagrafica.Sesso":"M"},"771":{"pettorale":"771","nome":"Crucifero Antonella","nazione":"IT","anagrafica.Sesso":"F"},"772":{"pettorale":"772","nome":"Mitchell Cal","nazione":"CA","anagrafica.Sesso":"M"},"773":{"pettorale":"773","nome":"Devine Keri","nazione":"NZ","anagrafica.Sesso":"F"},"774":{"pettorale":"774","nome":"Smith Robert","nazione":"NZ","anagrafica.Sesso":"M"},"775":{"pettorale":"775","nome":"MAPPELLI DAVIDE","nazione":"IT","anagrafica.Sesso":"M"},"776":{"pettorale":"776","nome":"FERRERO CLAUDIO","nazione":"IT","anagrafica.Sesso":"M"},"777":{"pettorale":"777","nome":"KOT VLADIMIR","nazione":"RU","anagrafica.Sesso":"M"},"778":{"pettorale":"778","nome":"Bal Sandro","nazione":"IT","anagrafica.Sesso":"M"},"779":{"pettorale":"779","nome":"TARGA  ANTONELLA","nazione":"IT","anagrafica.Sesso":"F"},"780":{"pettorale":"780","nome":"JEAN-LUC ROMAN","nazione":"BE","anagrafica.Sesso":"M"},"781":{"pettorale":"781","nome":"Schulz-Wulkow Alexander","nazione":"DE","anagrafica.Sesso":"M"},"782":{"pettorale":"782","nome":"Bossen Erik","nazione":"DK","anagrafica.Sesso":"M"},"783":{"pettorale":"783","nome":"PICCOLI ELIO","nazione":"IT","anagrafica.Sesso":"M"},"784":{"pettorale":"784","nome":"silviu ianos","nazione":"FR","anagrafica.Sesso":"M"},"785":{"pettorale":"785","nome":"Mocco Marco","nazione":"IT","anagrafica.Sesso":"M"},"786":{"pettorale":"786","nome":"Gonnelli Roberto","nazione":"IT","anagrafica.Sesso":"M"},"787":{"pettorale":"787","nome":"wong shu man","nazione":"HK","anagrafica.Sesso":"M"},"788":{"pettorale":"788","nome":"MUÃ±IZ ESTRADA ALEJANDRO","nazione":"ES","anagrafica.Sesso":"M"},"789":{"pettorale":"789","nome":"Vistarini Maria Ausilia","nazione":"IT","anagrafica.Sesso":"F"},"790":{"pettorale":"790","nome":"OLIVIER LEROY","nazione":"FR","anagrafica.Sesso":"M"},"791":{"pettorale":"791","nome":"Maria  Semerjian ","nazione":"FR","anagrafica.Sesso":"F"},"792":{"pettorale":"792","nome":"beraud jean-luc","nazione":"FR","anagrafica.Sesso":"M"},"793":{"pettorale":"793","nome":"StÃ©phane ROLAND","nazione":"FR","anagrafica.Sesso":"M"},"794":{"pettorale":"794","nome":"Petucco Claudio","nazione":"LU","anagrafica.Sesso":"M"},"795":{"pettorale":"795","nome":"Citarella Emiliano","nazione":"IT","anagrafica.Sesso":"M"},"796":{"pettorale":"796","nome":"eric sutter","nazione":"FR","anagrafica.Sesso":"M"},"797":{"pettorale":"797","nome":"Viorica Malai","nazione":"MD","anagrafica.Sesso":"F"},"798":{"pettorale":"798","nome":"jean-franÃ§ois Fredez","nazione":"FR","anagrafica.Sesso":"M"},"799":{"pettorale":"799","nome":"Guernieri Stefano","nazione":"IT","anagrafica.Sesso":"M"},"800":{"pettorale":"800","nome":"CHABOD  ILDO","nazione":"IT","anagrafica.Sesso":"M"},"801":{"pettorale":"801","nome":"Taylor Ben","nazione":"GB","anagrafica.Sesso":"M"},"802":{"pettorale":"802","nome":"Torresan Lerri","nazione":"IT","anagrafica.Sesso":"M"},"803":{"pettorale":"803","nome":"Tan Yeok Nguan","nazione":"SG","anagrafica.Sesso":"M"},"804":{"pettorale":"804","nome":"Miyazaki Michiko","nazione":"JP","anagrafica.Sesso":"F"},"805":{"pettorale":"805","nome":"david briand","nazione":"FR","anagrafica.Sesso":"M"},"806":{"pettorale":"806","nome":"MASSART JEAN CHRISTOPHE","nazione":"BE","anagrafica.Sesso":"M"},"807":{"pettorale":"807","nome":"francois Aussavis","nazione":"FR","anagrafica.Sesso":"M"},"808":{"pettorale":"808","nome":"Biancofiore  Franco","nazione":"IT","anagrafica.Sesso":"M"},"809":{"pettorale":"809","nome":"PREGNOLATO MARCO","nazione":"IT","anagrafica.Sesso":"M"},"810":{"pettorale":"810","nome":"CHALEYSSIN MARIE","nazione":"FR","anagrafica.Sesso":"F"},"811":{"pettorale":"811","nome":"KÃ©vin gaudin","nazione":"GF","anagrafica.Sesso":"M"},"812":{"pettorale":"812","nome":"vincent leray","nazione":"FR","anagrafica.Sesso":"M"},"813":{"pettorale":"813","nome":"pascal LAURENT","nazione":"FR","anagrafica.Sesso":"M"},"814":{"pettorale":"814","nome":"Enrico Gargano","nazione":"FR","anagrafica.Sesso":"M"},"815":{"pettorale":"815","nome":"Pavon Fabrizio","nazione":"IT","anagrafica.Sesso":"M"},"816":{"pettorale":"816","nome":"Azzolini Luca","nazione":"IT","anagrafica.Sesso":"M"},"817":{"pettorale":"817","nome":"tagliafraschi  claudio ","nazione":"IT","anagrafica.Sesso":"M"},"818":{"pettorale":"818","nome":"PintÃ³ Fulla Enric","nazione":"ES","anagrafica.Sesso":"M"},"819":{"pettorale":"819","nome":"CALDARA GUIDO","nazione":"IT","anagrafica.Sesso":"M"},"820":{"pettorale":"820","nome":"schiavon mauro","nazione":"IT","anagrafica.Sesso":"M"},"821":{"pettorale":"821","nome":"Benetti  Paolo ","nazione":"IT","anagrafica.Sesso":"M"},"822":{"pettorale":"822","nome":"kiessler klaus","nazione":"AT","anagrafica.Sesso":"M"},"823":{"pettorale":"823","nome":"pession susanna","nazione":"IT","anagrafica.Sesso":"F"},"824":{"pettorale":"824","nome":"EL OUAAMARI Samir","nazione":"FR","anagrafica.Sesso":"M"},"825":{"pettorale":"825","nome":"GrieÃŸbach Denis","nazione":"DE","anagrafica.Sesso":"M"},"826":{"pettorale":"826","nome":"YANG XIAOBO","nazione":"CN","anagrafica.Sesso":"M"},"827":{"pettorale":"827","nome":"PeÃ±ate SuÃ¡rez FermÃ­n","nazione":"ES","anagrafica.Sesso":"M"},"828":{"pettorale":"828","nome":"RUBALDO PAOLO","nazione":"IT","anagrafica.Sesso":"M"},"829":{"pettorale":"829","nome":"CHRISTOPHE SERGE","nazione":"FR","anagrafica.Sesso":"M"},"830":{"pettorale":"830","nome":"Samuel Marchand","nazione":"CH","anagrafica.Sesso":"M"},"831":{"pettorale":"831","nome":"BIZOT claude","nazione":"FR","anagrafica.Sesso":"M"},"832":{"pettorale":"832","nome":"Bosio 1 Georges","nazione":"FR","anagrafica.Sesso":"M"},"833":{"pettorale":"833","nome":"Furuya Keijiro","nazione":"JP","anagrafica.Sesso":"M"},"834":{"pettorale":"834","nome":"MACHET ERIK","nazione":"IT","anagrafica.Sesso":"M"},"835":{"pettorale":"835","nome":"laurent leclerc","nazione":"FR","anagrafica.Sesso":"M"},"836":{"pettorale":"836","nome":"Obreza Marko","nazione":"SI","anagrafica.Sesso":"M"},"837":{"pettorale":"837","nome":"riccardi omar","nazione":"IT","anagrafica.Sesso":"M"},"838":{"pettorale":"838","nome":"brean davide","nazione":"IT","anagrafica.Sesso":"M"},"839":{"pettorale":"839","nome":"Pitti Roberto","nazione":"IT","anagrafica.Sesso":"M"},"840":{"pettorale":"840","nome":"Charruaz Luca ","nazione":"IT","anagrafica.Sesso":"M"},"841":{"pettorale":"841","nome":"paulo caparicas","nazione":"GF","anagrafica.Sesso":"M"},"842":{"pettorale":"842","nome":"CHIAVAZZA DIEGO","nazione":"IT","anagrafica.Sesso":"M"},"843":{"pettorale":"843","nome":"jean claude mathieu","nazione":"FR","anagrafica.Sesso":"M"},"844":{"pettorale":"844","nome":"MAMINI GUIDO","nazione":"IT","anagrafica.Sesso":"M"},"845":{"pettorale":"845","nome":"Patrick Bohard","nazione":"FR","anagrafica.Sesso":"M"},"846":{"pettorale":"846","nome":"guillaume Leplat","nazione":"FR","anagrafica.Sesso":"M"},"847":{"pettorale":"847","nome":"zumeta garikoitz","nazione":"ES","anagrafica.Sesso":"M"},"848":{"pettorale":"848","nome":"Lee Mang Him","nazione":"HK","anagrafica.Sesso":"M"},"849":{"pettorale":"849","nome":"Michel Ramiere","nazione":"FR","anagrafica.Sesso":"M"},"850":{"pettorale":"850","nome":"Rovelli Giacomo","nazione":"IT","anagrafica.Sesso":"M"},"851":{"pettorale":"851","nome":"Dhuy JÃ©rÃ´me","nazione":"FR","anagrafica.Sesso":"M"},"852":{"pettorale":"852","nome":"Lepri  Marco","nazione":"IT","anagrafica.Sesso":"M"},"853":{"pettorale":"853","nome":"MICKAEL GRANDOUILLER","nazione":"FR","anagrafica.Sesso":"M"},"854":{"pettorale":"854","nome":"HARDOUIN MONROY FERDINANDO","nazione":"IT","anagrafica.Sesso":"M"},"855":{"pettorale":"855","nome":"Prosperi Giuseppe","nazione":"IT","anagrafica.Sesso":"M"},"856":{"pettorale":"856","nome":"Denis Grandjean","nazione":"CH","anagrafica.Sesso":"M"},"857":{"pettorale":"857","nome":"ISHII HARUKA","nazione":"JP","anagrafica.Sesso":"M"},"858":{"pettorale":"858","nome":"MARCHETTI ANNA","nazione":"IT","anagrafica.Sesso":"F"},"859":{"pettorale":"859","nome":"Maurina Marco","nazione":"IT","anagrafica.Sesso":"M"},"860":{"pettorale":"860","nome":"RAMELLO MARCO","nazione":"IT","anagrafica.Sesso":"M"},"861":{"pettorale":"861","nome":"DIDIER GARNIER","nazione":"FR","anagrafica.Sesso":"M"},"862":{"pettorale":"862","nome":"Perruquet Aldo","nazione":"IT","anagrafica.Sesso":"M"},"863":{"pettorale":"863","nome":"Nunan Richard ","nazione":"IE","anagrafica.Sesso":"M"},"864":{"pettorale":"864","nome":"Nikolic Marina","nazione":"RS","anagrafica.Sesso":"F"},"865":{"pettorale":"865","nome":"communod claudio","nazione":"IT","anagrafica.Sesso":"M"},"866":{"pettorale":"866","nome":"Vagnone Enrico","nazione":"IT","anagrafica.Sesso":"M"},"867":{"pettorale":"867","nome":"Yvon Girard","nazione":"FR","anagrafica.Sesso":"M"},"868":{"pettorale":"868","nome":"Bengoa Anza Unai","nazione":"ES","anagrafica.Sesso":"M"},"869":{"pettorale":"869","nome":"cavorsin jeanclaude","nazione":"IT","anagrafica.Sesso":"M"},"870":{"pettorale":"870","nome":"Simon Willems","nazione":"BE","anagrafica.Sesso":"M"},"871":{"pettorale":"871","nome":"Greenslade John","nazione":"GB","anagrafica.Sesso":"M"},"872":{"pettorale":"872","nome":"Radi Davide","nazione":"IT","anagrafica.Sesso":"M"},"873":{"pettorale":"873","nome":"colle gabriele","nazione":"IT","anagrafica.Sesso":"M"},"874":{"pettorale":"874","nome":"Lombardo Alessandro ","nazione":"IT","anagrafica.Sesso":"M"},"875":{"pettorale":"875","nome":"Castellino Alberto","nazione":"IT","anagrafica.Sesso":"M"},"876":{"pettorale":"876","nome":"DANVEL MORGAN","nazione":"FR","anagrafica.Sesso":"M"},"877":{"pettorale":"877","nome":"Settembrini Nicola","nazione":"IT","anagrafica.Sesso":"M"},"878":{"pettorale":"878","nome":"SOLDA&#039; SIMONE","nazione":"IT","anagrafica.Sesso":"M"},"879":{"pettorale":"879","nome":"Rodriguez PiÃ±ol Francisco Javier","nazione":"ES","anagrafica.Sesso":"M"},"880":{"pettorale":"880","nome":"carrara livio","nazione":"IT","anagrafica.Sesso":"M"},"881":{"pettorale":"881","nome":"mastrodicasa marcello","nazione":"IT","anagrafica.Sesso":"M"},"882":{"pettorale":"882","nome":"stocchi paolo","nazione":"IT","anagrafica.Sesso":"M"},"883":{"pettorale":"883","nome":"romain truchot","nazione":"FR","anagrafica.Sesso":"M"},"884":{"pettorale":"884","nome":"Roveyaz Marino","nazione":"IT","anagrafica.Sesso":"M"},"885":{"pettorale":"885","nome":"Case Stephanie","nazione":"PS","anagrafica.Sesso":"F"},"886":{"pettorale":"886","nome":"Abell Richard","nazione":"GB","anagrafica.Sesso":"M"},"887":{"pettorale":"887","nome":"Masiero Alessandro","nazione":"IT","anagrafica.Sesso":"M"},"888":{"pettorale":"888","nome":"ZANELLA RUDJ","nazione":"IT","anagrafica.Sesso":"M"},"889":{"pettorale":"889","nome":"mariotti giovanni","nazione":"IT","anagrafica.Sesso":"M"},"890":{"pettorale":"890","nome":"pu gewen","nazione":"CN","anagrafica.Sesso":"M"},"891":{"pettorale":"891","nome":"yin ping","nazione":"CN","anagrafica.Sesso":"F"},"892":{"pettorale":"892","nome":"Jean Francois BASTIN","nazione":"BE","anagrafica.Sesso":"M"},"893":{"pettorale":"893","nome":"Pidello Gian Marco","nazione":"IT","anagrafica.Sesso":"M"},"894":{"pettorale":"894","nome":"Spedicato Stefano","nazione":"IT","anagrafica.Sesso":"M"},"895":{"pettorale":"895","nome":"Massa Federico","nazione":"IT","anagrafica.Sesso":"M"},"896":{"pettorale":"896","nome":"RÃ©my PIZZONERO","nazione":"FR","anagrafica.Sesso":"M"},"897":{"pettorale":"897","nome":"Isolda Roberto","nazione":"IT","anagrafica.Sesso":"M"},"898":{"pettorale":"898","nome":"Perseghin Francesca","nazione":"IT","anagrafica.Sesso":"F"},"899":{"pettorale":"899","nome":"Jean-Bernard SAINT-EVE","nazione":"FR","anagrafica.Sesso":"M"},"900":{"pettorale":"900","nome":"Aliaga Ochandio Benjamin","nazione":"ES","anagrafica.Sesso":"M"},"901":{"pettorale":"901","nome":"Ricciardiello Antonio","nazione":"IT","anagrafica.Sesso":"M"},"902":{"pettorale":"902","nome":"vismara mario","nazione":"IT","anagrafica.Sesso":"M"},"903":{"pettorale":"903","nome":"cauteruccio rocco","nazione":"IT","anagrafica.Sesso":"M"},"904":{"pettorale":"904","nome":"SESSA EVELINA","nazione":"IT","anagrafica.Sesso":"F"},"905":{"pettorale":"905","nome":"Giuliano Guido","nazione":"IT","anagrafica.Sesso":"M"},"906":{"pettorale":"906","nome":"LAURENT GIULIANI","nazione":"CH","anagrafica.Sesso":"M"},"907":{"pettorale":"907","nome":"Ishii Hiroyuki","nazione":"JP","anagrafica.Sesso":"M"},"908":{"pettorale":"908","nome":"Bottone Giulio","nazione":"IT","anagrafica.Sesso":"M"},"909":{"pettorale":"909","nome":"Galloni Fabrizio","nazione":"IT","anagrafica.Sesso":"M"},"910":{"pettorale":"910","nome":"petitjacques gildo andrea","nazione":"IT","anagrafica.Sesso":"M"},"911":{"pettorale":"911","nome":"Savoye Christophe","nazione":"IT","anagrafica.Sesso":"M"},"912":{"pettorale":"912","nome":"Giacobbe Paolo","nazione":"IT","anagrafica.Sesso":"M"},"913":{"pettorale":"913","nome":"perin sara","nazione":"IT","anagrafica.Sesso":"F"},"914":{"pettorale":"914","nome":"SCHNITZER HANNES","nazione":"AT","anagrafica.Sesso":"M"},"915":{"pettorale":"915","nome":"FeliÅ„ski JarosÅ‚aw","nazione":"PL","anagrafica.Sesso":"M"},"916":{"pettorale":"916","nome":"BLANC Elisabeth","nazione":"FR","anagrafica.Sesso":"F"},"917":{"pettorale":"917","nome":"Benamati Michele","nazione":"IT","anagrafica.Sesso":"M"},"918":{"pettorale":"918","nome":"Immediata Antonio","nazione":"IT","anagrafica.Sesso":"M"},"919":{"pettorale":"919","nome":"Cernuda Aldecoa Julio","nazione":"ES","anagrafica.Sesso":"M"},"920":{"pettorale":"920","nome":"HOPWOOD PAUL","nazione":"AU","anagrafica.Sesso":"M"},"922":{"pettorale":"922","nome":"BREYSSE Christian","nazione":"FR","anagrafica.Sesso":"M"},"923":{"pettorale":"923","nome":"Giordano Maurizio","nazione":"IT","anagrafica.Sesso":"M"},"924":{"pettorale":"924","nome":"perera christian","nazione":"IT","anagrafica.Sesso":"M"},"925":{"pettorale":"925","nome":"Serradell Macau Marc","nazione":"ES","anagrafica.Sesso":"M"},"926":{"pettorale":"926","nome":"Tonelli Manuela ","nazione":"IT","anagrafica.Sesso":"F"},"927":{"pettorale":"927","nome":"gaetan jeanney","nazione":"FR","anagrafica.Sesso":"M"},"928":{"pettorale":"928","nome":"LAMOTTE mauo","nazione":"IT","anagrafica.Sesso":"M"},"929":{"pettorale":"929","nome":"ThiÃ©bat Orlando","nazione":"IT","anagrafica.Sesso":"M"},"930":{"pettorale":"930","nome":"valenti luca","nazione":"IT","anagrafica.Sesso":"M"},"931":{"pettorale":"931","nome":"Zimei Andrea ","nazione":"IT","anagrafica.Sesso":"M"},"932":{"pettorale":"932","nome":"FRANCESCHINIS MIRKO","nazione":"IT","anagrafica.Sesso":"M"},"933":{"pettorale":"933","nome":"CHARLES LAJUS","nazione":"FR","anagrafica.Sesso":"M"},"934":{"pettorale":"934","nome":"Grisenti Sandro","nazione":"IT","anagrafica.Sesso":"M"},"935":{"pettorale":"935","nome":"Imberti Osvaldo","nazione":"IT","anagrafica.Sesso":"M"},"936":{"pettorale":"936","nome":"Savoye Marco","nazione":"IT","anagrafica.Sesso":"M"},"937":{"pettorale":"937","nome":"bari gianpiero","nazione":"IT","anagrafica.Sesso":"M"},"938":{"pettorale":"938","nome":"URRUTIKOETXEA BILBAO UNAI","nazione":"ES","anagrafica.Sesso":"M"},"939":{"pettorale":"939","nome":"Kepka Petr","nazione":"CZ","anagrafica.Sesso":"M"},"940":{"pettorale":"940","nome":"FRANCHI EDY","nazione":"IT","anagrafica.Sesso":"M"},"941":{"pettorale":"941","nome":"SimÃ£o Diogo","nazione":"PT","anagrafica.Sesso":"M"},"942":{"pettorale":"942","nome":"Claude THINE","nazione":"GP","anagrafica.Sesso":"M"},"943":{"pettorale":"943","nome":"GIRAUDEAU XAVIER","nazione":"FR","anagrafica.Sesso":"M"},"944":{"pettorale":"944","nome":"galli augusto","nazione":"IT","anagrafica.Sesso":"M"},"945":{"pettorale":"945","nome":"Sarvadon Piero","nazione":"IT","anagrafica.Sesso":"M"},"946":{"pettorale":"946","nome":"Rossell Falco Carles","nazione":"AD","anagrafica.Sesso":"M"},"947":{"pettorale":"947","nome":"Gepy de Perglas","nazione":"FR","anagrafica.Sesso":"M"},"948":{"pettorale":"948","nome":"Bellot Emanuele Ottaviano","nazione":"IT","anagrafica.Sesso":"M"},"949":{"pettorale":"949","nome":"Grillo Ennio","nazione":"IT","anagrafica.Sesso":"M"},"950":{"pettorale":"950","nome":"Sanz LÃ¡zaro Roberto","nazione":"ES","anagrafica.Sesso":"M"},"951":{"pettorale":"951","nome":"BRUNOD MARIO","nazione":"IT","anagrafica.Sesso":"M"},"952":{"pettorale":"952","nome":"YAHYA RAZIF","nazione":"MY","anagrafica.Sesso":"M"},"953":{"pettorale":"953","nome":"pilloni andrea","nazione":"IT","anagrafica.Sesso":"M"},"954":{"pettorale":"954","nome":"Maurice (Passuello) Andrea","nazione":"IT","anagrafica.Sesso":"M"},"955":{"pettorale":"955","nome":"Rumbles Allan","nazione":"GB","anagrafica.Sesso":"M"},"956":{"pettorale":"956","nome":"Romain Resmini","nazione":"CH","anagrafica.Sesso":"M"},"957":{"pettorale":"957","nome":"Styllas Michael","nazione":"GR","anagrafica.Sesso":"M"},"958":{"pettorale":"958","nome":"DALTON GARY","nazione":"GB","anagrafica.Sesso":"M"},"959":{"pettorale":"959","nome":"Colombo Paolo","nazione":"IT","anagrafica.Sesso":"M"},"960":{"pettorale":"960","nome":"Olivier Dufour","nazione":"MC","anagrafica.Sesso":"M"},"961":{"pettorale":"961","nome":"Perez Palencia Santiago","nazione":"ES","anagrafica.Sesso":"M"},"962":{"pettorale":"962","nome":"Dell&#039;Acqua Andrea","nazione":"FR","anagrafica.Sesso":"M"},"963":{"pettorale":"963","nome":"Bertolini Michele","nazione":"IT","anagrafica.Sesso":"M"},"964":{"pettorale":"964","nome":"Grisorio Vincenzo","nazione":"IT","anagrafica.Sesso":"M"},"965":{"pettorale":"965","nome":"squara donato","nazione":"IT","anagrafica.Sesso":"M"},"967":{"pettorale":"967","nome":"Eric Faust","nazione":"FR","anagrafica.Sesso":"M"},"968":{"pettorale":"968","nome":"MALINVERNO PIERO","nazione":"IT","anagrafica.Sesso":"M"},"969":{"pettorale":"969","nome":"contri giovanni","nazione":"IT","anagrafica.Sesso":"M"},"970":{"pettorale":"970","nome":"EFTHIMIADIS GIORGOS","nazione":"GR","anagrafica.Sesso":"M"},"971":{"pettorale":"971","nome":"Thomas Ernst","nazione":"CH","anagrafica.Sesso":"M"},"972":{"pettorale":"972","nome":"Chelius Guillaume","nazione":"FR","anagrafica.Sesso":"M"},"973":{"pettorale":"973","nome":"barbieri matteo","nazione":"IT","anagrafica.Sesso":"M"},"974":{"pettorale":"974","nome":"Jean-claude BEAUMEL","nazione":"FR","anagrafica.Sesso":"M"},"975":{"pettorale":"975","nome":"GUIDETTI ENRICO","nazione":"IT","anagrafica.Sesso":"M"},"976":{"pettorale":"976","nome":"Irina Malejonock","nazione":"FR","anagrafica.Sesso":"F"},"977":{"pettorale":"977","nome":"GALLO ALBERTO","nazione":"IT","anagrafica.Sesso":"M"},"978":{"pettorale":"978","nome":"jerome clerc","nazione":"FR","anagrafica.Sesso":"M"},"979":{"pettorale":"979","nome":"TOURON JEAN MICHEL","nazione":"FR","anagrafica.Sesso":"M"},"980":{"pettorale":"980","nome":"Sarvadon Paolo","nazione":"IT","anagrafica.Sesso":"M"},"981":{"pettorale":"981","nome":"TODA JUN","nazione":"JP","anagrafica.Sesso":"M"},"982":{"pettorale":"982","nome":"Rodolph  Mercanton ","nazione":"FR","anagrafica.Sesso":"M"},"983":{"pettorale":"983","nome":"LAWSON CAT","nazione":"GB","anagrafica.Sesso":"F"},"984":{"pettorale":"984","nome":"BUCCELLA MAURO","nazione":"IT","anagrafica.Sesso":"M"},"985":{"pettorale":"985","nome":"Jean-Louis Juillerat","nazione":"CH","anagrafica.Sesso":"M"},"986":{"pettorale":"986","nome":"Herren Luciano Paolo","nazione":"IT","anagrafica.Sesso":"M"},"987":{"pettorale":"987","nome":"Testa Nadia ","nazione":"IT","anagrafica.Sesso":"F"},"988":{"pettorale":"988","nome":"carrara sonia","nazione":"IT","anagrafica.Sesso":"F"},"989":{"pettorale":"989","nome":"CARRARA PIERALBERTO","nazione":"IT","anagrafica.Sesso":"M"},"990":{"pettorale":"990","nome":"Pilati Andrea","nazione":"IT","anagrafica.Sesso":"M"},"991":{"pettorale":"991","nome":"MARMET PATRICE","nazione":"FR","anagrafica.Sesso":"M"},"992":{"pettorale":"992","nome":"FERRAN CALZADA FERMI","nazione":"ES","anagrafica.Sesso":"M"},"993":{"pettorale":"993","nome":"Helmuth Weil","nazione":"DE","anagrafica.Sesso":"M"},"994":{"pettorale":"994","nome":"lisa gian luca","nazione":"IT","anagrafica.Sesso":"M"},"995":{"pettorale":"995","nome":"Renard Gaetan","nazione":"ES","anagrafica.Sesso":"M"},"996":{"pettorale":"996","nome":"Julien MAIRE","nazione":"FR","anagrafica.Sesso":"M"},"997":{"pettorale":"997","nome":"Pierre Meyer","nazione":"FR","anagrafica.Sesso":"M"},"998":{"pettorale":"998","nome":"CELAL DEVRIM","nazione":"CY","anagrafica.Sesso":"M"},"999":{"pettorale":"999","nome":"RUBBO IGOR","nazione":"IT","anagrafica.Sesso":"M"},"1000":{"pettorale":"1000","nome":"berardi walter","nazione":"IT","anagrafica.Sesso":"M"},"1001":{"pettorale":"1001","nome":"BÃ©atrice Brasey","nazione":"CH","anagrafica.Sesso":"F"},"1002":{"pettorale":"1002","nome":"CALISTI ALESSANDRO","nazione":"IT","anagrafica.Sesso":"M"},"1003":{"pettorale":"1003","nome":"Barbero Massimo","nazione":"IT","anagrafica.Sesso":"M"},"1004":{"pettorale":"1004","nome":"Correia Manuel Maria","nazione":"PT","anagrafica.Sesso":"M"},"1005":{"pettorale":"1005","nome":"Cebrowski Hugo","nazione":"AR","anagrafica.Sesso":"M"},"1006":{"pettorale":"1006","nome":"QUINTANA SANTANA DANIEL","nazione":"ES","anagrafica.Sesso":"M"},"1007":{"pettorale":"1007","nome":"banfi fabio","nazione":"IT","anagrafica.Sesso":"M"},"1008":{"pettorale":"1008","nome":"Scalas Bruno","nazione":"IT","anagrafica.Sesso":"M"},"1009":{"pettorale":"1009","nome":"DELLA ROSSA DAVIDE","nazione":"IT","anagrafica.Sesso":"M"},"1010":{"pettorale":"1010","nome":"TUBERGA ENRICO","nazione":"IT","anagrafica.Sesso":"M"},"1011":{"pettorale":"1011","nome":"Heizmann  Thomas","nazione":"DE","anagrafica.Sesso":"M"},"1012":{"pettorale":"1012","nome":"Ravarono Alessandro","nazione":"IT","anagrafica.Sesso":"M"},"1013":{"pettorale":"1013","nome":"facchinetti flavio","nazione":"IT","anagrafica.Sesso":"M"},"1014":{"pettorale":"1014","nome":"van Dijk Frederic","nazione":"FR","anagrafica.Sesso":"M"},"1015":{"pettorale":"1015","nome":"MARTIN Bertrand","nazione":"NO","anagrafica.Sesso":"M"},"1016":{"pettorale":"1016","nome":"Bernard Armin","nazione":"DE","anagrafica.Sesso":"M"},"1017":{"pettorale":"1017","nome":"Kojima Yuki","nazione":"JP","anagrafica.Sesso":"F"},"1018":{"pettorale":"1018","nome":"brian agustin","nazione":"AR","anagrafica.Sesso":"M"},"1019":{"pettorale":"1019","nome":"TOMÃ© HELDER MANUEL MARTINS","nazione":"PT","anagrafica.Sesso":"M"},"1020":{"pettorale":"1020","nome":"butcher bill","nazione":"US","anagrafica.Sesso":"M"},"1021":{"pettorale":"1021","nome":"Houghton Robin","nazione":"GB","anagrafica.Sesso":"M"},"1022":{"pettorale":"1022","nome":"Orsolini Maurizio Alex","nazione":"IT","anagrafica.Sesso":"M"},"1023":{"pettorale":"1023","nome":"PASQUALI ROBERTO","nazione":"IT","anagrafica.Sesso":"M"},"1024":{"pettorale":"1024","nome":"COLABELLO LUIGI","nazione":"IT","anagrafica.Sesso":"M"},"1025":{"pettorale":"1025","nome":"Niecke Susanne","nazione":"DE","anagrafica.Sesso":"F"},"1026":{"pettorale":"1026","nome":"Colliva Paolo","nazione":"IT","anagrafica.Sesso":"M"},"1027":{"pettorale":"1027","nome":"Niecke Torsten","nazione":"DE","anagrafica.Sesso":"M"},"1028":{"pettorale":"1028","nome":"Alfier Alessio","nazione":"IT","anagrafica.Sesso":"M"},"1029":{"pettorale":"1029","nome":"Noma Yoko","nazione":"JP","anagrafica.Sesso":"F"},"1030":{"pettorale":"1030","nome":"Rossato Enrico","nazione":"IT","anagrafica.Sesso":"M"},"1031":{"pettorale":"1031","nome":"TACCHINI DENIS","nazione":"IT","anagrafica.Sesso":"M"},"1032":{"pettorale":"1032","nome":"di meo gianluca","nazione":"IT","anagrafica.Sesso":"M"},"1033":{"pettorale":"1033","nome":"HjelmÃ©r Magnus","nazione":"SE","anagrafica.Sesso":"M"},"1034":{"pettorale":"1034","nome":"Pierotti Alberto","nazione":"IT","anagrafica.Sesso":"M"},"1035":{"pettorale":"1035","nome":"Lattanzi Mark","nazione":"US","anagrafica.Sesso":"M"},"1036":{"pettorale":"1036","nome":"ESCUTÃ‰ MARIN JUAN CARLOS","nazione":"ES","anagrafica.Sesso":"M"},"1037":{"pettorale":"1037","nome":"Alesom Imanol","nazione":"ES","anagrafica.Sesso":"M"},"1038":{"pettorale":"1038","nome":"Zapata muÃ±oz Juan","nazione":"ES","anagrafica.Sesso":"M"},"1039":{"pettorale":"1039","nome":"rossetti nicoletta","nazione":"IT","anagrafica.Sesso":"F"},"1040":{"pettorale":"1040","nome":"Moray Francoise","nazione":"BE","anagrafica.Sesso":"F"},"1041":{"pettorale":"1041","nome":"Saviozzi Francesco","nazione":"IT","anagrafica.Sesso":"M"},"1042":{"pettorale":"1042","nome":"zaniboni daniele","nazione":"IT","anagrafica.Sesso":"M"},"1043":{"pettorale":"1043","nome":"zuppanelli vezio","nazione":"IT","anagrafica.Sesso":"M"},"1044":{"pettorale":"1044","nome":"Ganis Gabriel","nazione":"IT","anagrafica.Sesso":"M"},"1045":{"pettorale":"1045","nome":"sakata keiichiro","nazione":"JP","anagrafica.Sesso":"M"},"1046":{"pettorale":"1046","nome":"MORAN  CARLOS","nazione":"ES","anagrafica.Sesso":"M"},"1047":{"pettorale":"1047","nome":"yan vintrou","nazione":"FR","anagrafica.Sesso":"M"},"1048":{"pettorale":"1048","nome":"NICCO ENNIO","nazione":"IT","anagrafica.Sesso":"M"},"1049":{"pettorale":"1049","nome":"lovstad moses","nazione":"DK","anagrafica.Sesso":"M"},"1050":{"pettorale":"1050","nome":"Bastida Arrate","nazione":"ES","anagrafica.Sesso":"F"},"1051":{"pettorale":"1051","nome":"ferrario franco","nazione":"IT","anagrafica.Sesso":"M"},"1052":{"pettorale":"1052","nome":"GIACOMA-GHELLO Sonia","nazione":"IT","anagrafica.Sesso":"F"},"1053":{"pettorale":"1053","nome":"Borbey Sergio","nazione":"IT","anagrafica.Sesso":"M"},"1054":{"pettorale":"1054","nome":"LACQUA MASSIMILIANO","nazione":"IT","anagrafica.Sesso":"M"},"1055":{"pettorale":"1055","nome":"MELACARNE MICHELE","nazione":"IT","anagrafica.Sesso":"M"},"1056":{"pettorale":"1056","nome":"CORINNE RANDIN","nazione":"CH","anagrafica.Sesso":"F"},"1057":{"pettorale":"1057","nome":"tasca mario alessandro","nazione":"IT","anagrafica.Sesso":"M"},"1058":{"pettorale":"1058","nome":"De Prati Giovanni","nazione":"IT","anagrafica.Sesso":"M"},"1059":{"pettorale":"1059","nome":"Dixon Helen","nazione":"IE","anagrafica.Sesso":"F"},"1060":{"pettorale":"1060","nome":"ANMELLA didier","nazione":"FR","anagrafica.Sesso":"M"},"1061":{"pettorale":"1061","nome":"HORVÃ¡TH PÃ©TER","nazione":"HU","anagrafica.Sesso":"M"},"1062":{"pettorale":"1062","nome":"Fridrich LÃ¡szlÃ³","nazione":"HU","anagrafica.Sesso":"M"},"1063":{"pettorale":"1063","nome":"Mochizuki Shogo","nazione":"JP","anagrafica.Sesso":"M"},"1064":{"pettorale":"1064","nome":"sampaio joaquim","nazione":"PT","anagrafica.Sesso":"M"},"1065":{"pettorale":"1065","nome":"Hanney Roger","nazione":"AU","anagrafica.Sesso":"M"},"1066":{"pettorale":"1066","nome":"Anjo Akemi","nazione":"JP","anagrafica.Sesso":"F"},"1067":{"pettorale":"1067","nome":"Pezzotti Patrick","nazione":"IT","anagrafica.Sesso":"M"},"1068":{"pettorale":"1068","nome":"Maresca Atilio","nazione":"AR","anagrafica.Sesso":"M"},"1069":{"pettorale":"1069","nome":"VicquÃ©ry Laurent","nazione":"IT","anagrafica.Sesso":"M"},"1070":{"pettorale":"1070","nome":"Troiano Donato","nazione":"IT","anagrafica.Sesso":"M"},"1071":{"pettorale":"1071","nome":"Degli Innocenti Stefano","nazione":"IT","anagrafica.Sesso":"M"},"1072":{"pettorale":"1072","nome":"Salcher Robert","nazione":"DE","anagrafica.Sesso":"M"},"1073":{"pettorale":"1073","nome":"Jean-Marc DOSSOT","nazione":"FR","anagrafica.Sesso":"M"},"1074":{"pettorale":"1074","nome":"ValÃ©rick Perrin","nazione":"FR","anagrafica.Sesso":"M"},"1075":{"pettorale":"1075","nome":"Tiberiu Useriu","nazione":"RO","anagrafica.Sesso":"M"},"1076":{"pettorale":"1076","nome":"colombo emanuele","nazione":"IT","anagrafica.Sesso":"M"},"1077":{"pettorale":"1077","nome":"Peltonen Garrett","nazione":"US","anagrafica.Sesso":"M"},"1078":{"pettorale":"1078","nome":"ferraro simone","nazione":"IT","anagrafica.Sesso":"M"},"1079":{"pettorale":"1079","nome":"Meredith Joel","nazione":"US","anagrafica.Sesso":"M"},"1080":{"pettorale":"1080","nome":"DIEGO DANERI","nazione":"AR","anagrafica.Sesso":"M"},"1081":{"pettorale":"1081","nome":"Saulo Alberto","nazione":"IT","anagrafica.Sesso":"M"},"1082":{"pettorale":"1082","nome":"Epifanio Antonio","nazione":"IT","anagrafica.Sesso":"M"},"1083":{"pettorale":"1083","nome":"Mosquera GonzÃ¡lez Manuel","nazione":"ES","anagrafica.Sesso":"M"},"1084":{"pettorale":"1084","nome":"MITSIOU GEORGIA","nazione":"GR","anagrafica.Sesso":"F"},"1085":{"pettorale":"1085","nome":"ducly remo","nazione":"IT","anagrafica.Sesso":"M"},"1086":{"pettorale":"1086","nome":"MANGITSIS NIKOLAOS","nazione":"GR","anagrafica.Sesso":"M"},"1087":{"pettorale":"1087","nome":"Coca Andrei Cosmin","nazione":"RO","anagrafica.Sesso":"M"},"1088":{"pettorale":"1088","nome":"caselli cristian","nazione":"IT","anagrafica.Sesso":"M"},"1089":{"pettorale":"1089","nome":"Locatelli Sonia","nazione":"IT","anagrafica.Sesso":"F"},"1090":{"pettorale":"1090","nome":"Carmine Valerio","nazione":"IT","anagrafica.Sesso":"M"},"1091":{"pettorale":"1091","nome":"grange giuseppe","nazione":"IT","anagrafica.Sesso":"M"},"1092":{"pettorale":"1092","nome":"CRIADO TOCA PABLO","nazione":"ES","anagrafica.Sesso":"M"},"1093":{"pettorale":"1093","nome":"THERIN CEDRIC ","nazione":"FR","anagrafica.Sesso":"M"},"1094":{"pettorale":"1094","nome":"Neganov Maxim","nazione":"IT","anagrafica.Sesso":"M"},"1095":{"pettorale":"1095","nome":"PIRALLA PIERLUIGI","nazione":"IT","anagrafica.Sesso":"M"},"1096":{"pettorale":"1096","nome":"STEVENIN MAURO","nazione":"IT","anagrafica.Sesso":"M"},"1097":{"pettorale":"1097","nome":"Pusceddu Alessandro","nazione":"IT","anagrafica.Sesso":"M"},"1098":{"pettorale":"1098","nome":"GAIDA MARCO","nazione":"IT","anagrafica.Sesso":"M"},"1099":{"pettorale":"1099","nome":"recanzone renzo","nazione":"IT","anagrafica.Sesso":"M"},"1100":{"pettorale":"1100","nome":"Pession Jules","nazione":"IT","anagrafica.Sesso":"M"},"1101":{"pettorale":"1101","nome":"ascoli alessandro","nazione":"IT","anagrafica.Sesso":"M"},"1102":{"pettorale":"1102","nome":"scrimieri claudio","nazione":"IT","anagrafica.Sesso":"M"},"1103":{"pettorale":"1103","nome":"Susanna Marco","nazione":"IT","anagrafica.Sesso":"M"},"1104":{"pettorale":"1104","nome":"CERISE STEFANO","nazione":"IT","anagrafica.Sesso":"M"},"1105":{"pettorale":"1105","nome":"VERTHUY VIVIANA","nazione":"IT","anagrafica.Sesso":"F"},"1106":{"pettorale":"1106","nome":"BRACOTTO GIOVANNI GIUSEPPE","nazione":"IT","anagrafica.Sesso":"M"},"1107":{"pettorale":"1107","nome":"Medici Andrea","nazione":"IT","anagrafica.Sesso":"M"},"1108":{"pettorale":"1108","nome":"ROLLANDIN AUGUSTO","nazione":"IT","anagrafica.Sesso":"M"},"1109":{"pettorale":"1109","nome":"BRUNOD BRUNO","nazione":"IT","anagrafica.Sesso":"M"},"1110":{"pettorale":"1110","nome":"Balbis Paola","nazione":"IT","anagrafica.Sesso":"F"},"1111":{"pettorale":"1111","nome":"BAROLI GIUSEPPE","nazione":"IT","anagrafica.Sesso":"M"},"1112":{"pettorale":"1112","nome":"Courthoud Giorgio Noel","nazione":"IT","anagrafica.Sesso":"M"},"1113":{"pettorale":"1113","nome":"Mondardini Giorgio","nazione":"IT","anagrafica.Sesso":"M"},"1114":{"pettorale":"1114","nome":"STACCHETTI PIERINO","nazione":"IT","anagrafica.Sesso":"M"},"1115":{"pettorale":"1115","nome":"barocco ennio","nazione":"IT","anagrafica.Sesso":"M"},"1116":{"pettorale":"1116","nome":"Pajaro Paolo","nazione":"IT","anagrafica.Sesso":"M"},"1117":{"pettorale":"1117","nome":"GIRALDO GABRIELE","nazione":"IT","anagrafica.Sesso":"M"},"1118":{"pettorale":"1118","nome":"Vevey Augusto","nazione":"IT","anagrafica.Sesso":"M"},"1119":{"pettorale":"1119","nome":"GILARDI Federico","nazione":"FR","anagrafica.Sesso":"M"},"1120":{"pettorale":"1120","nome":"ANTONELLI LUCA","nazione":"IT","anagrafica.Sesso":"M"},"1121":{"pettorale":"1121","nome":"EICHERT UWE","nazione":"IT","anagrafica.Sesso":"M"},"1122":{"pettorale":"1122","nome":"PIGONI MATTEO","nazione":"IT","anagrafica.Sesso":"M"},"1123":{"pettorale":"1123","nome":"PARIGI MARIACHIARA","nazione":"IT","anagrafica.Sesso":"F"},"1124":{"pettorale":"1124","nome":"Thomas Ehmke","nazione":"DE","anagrafica.Sesso":"M"},"1125":{"pettorale":"1125","nome":"PENSA PATRIZIA","nazione":"IT","anagrafica.Sesso":"F"},"1126":{"pettorale":"1126","nome":"jige liu","nazione":"CN","anagrafica.Sesso":"M"},"1127":{"pettorale":"1127","nome":"Li Renli","nazione":"CN","anagrafica.Sesso":"M"},"1128":{"pettorale":"1128","nome":"Zhao Peng","nazione":"CN","anagrafica.Sesso":"F"},"1129":{"pettorale":"1129","nome":"Dunkerbeck Thomas","nazione":"NL","anagrafica.Sesso":"M"},"1130":{"pettorale":"1130","nome":"Bil Marjolein ","nazione":"NL","anagrafica.Sesso":"F"},"1131":{"pettorale":"1131","nome":"ARTIGUE RODRIGUEZ FELIPE ","nazione":"ES","anagrafica.Sesso":"M"},"1132":{"pettorale":"1132","nome":"reymondet fochira valter","nazione":"IT","anagrafica.Sesso":"M"},"1133":{"pettorale":"1133","nome":"Evangelisti Michele","nazione":"IT","anagrafica.Sesso":"M"},"1134":{"pettorale":"1134","nome":"Mora Cecila","nazione":"IT","anagrafica.Sesso":"F"},"1135":{"pettorale":"1135","nome":"Di Francesco Nicola","nazione":"IT","anagrafica.Sesso":"M"},"1136":{"pettorale":"1136","nome":"Kwakkenbos Paul","nazione":"NL","anagrafica.Sesso":"M"},"1137":{"pettorale":"1137","nome":"Voyat Christian","nazione":"IT","anagrafica.Sesso":"M"},"1138":{"pettorale":"1138","nome":"visintin lorenza","nazione":"IT","anagrafica.Sesso":"F"},"1139":{"pettorale":"1139","nome":"Marta Massimiliano","nazione":"IT","anagrafica.Sesso":"M"},"1140":{"pettorale":"1140","nome":"KANOBELJ MARCO","nazione":"IT","anagrafica.Sesso":"M"},"1141":{"pettorale":"1141","nome":"LEVAI VALERIE","nazione":"FR","anagrafica.Sesso":"F"},"1142":{"pettorale":"1142","nome":"Hart Matt","nazione":"US","anagrafica.Sesso":"M"},"1143":{"pettorale":"1143","nome":"Marchand Stephane","nazione":"FR","anagrafica.Sesso":"M"},"1144":{"pettorale":"1144","nome":"CEDRIC REDON","nazione":"FR","anagrafica.Sesso":"M"},"1145":{"pettorale":"1145","nome":"mori marco","nazione":"IT","anagrafica.Sesso":"M"},"1146":{"pettorale":"1146","nome":"TASSELLI CRISTINA","nazione":"IT","anagrafica.Sesso":"F"},"1147":{"pettorale":"1147","nome":"DEL GIUDICE ANGELO","nazione":"IT","anagrafica.Sesso":"M"},"1148":{"pettorale":"1148","nome":"Sample Andrew","nazione":"GB","anagrafica.Sesso":"M"},"1149":{"pettorale":"1149","nome":"Drescher Anke","nazione":"DE","anagrafica.Sesso":"F"},"1150":{"pettorale":"1150","nome":"JAIME SCOTT","nazione":"US","anagrafica.Sesso":"M"},"1151":{"pettorale":"1151","nome":"ALFIERI NICOLA","nazione":"IT","anagrafica.Sesso":"M"},"1152":{"pettorale":"1152","nome":"pierre pelletier","nazione":"GB","anagrafica.Sesso":"M"},"1153":{"pettorale":"1153","nome":"landi riccardo","nazione":"IT","anagrafica.Sesso":"M"},"1154":{"pettorale":"1154","nome":"Risso Marco","nazione":"IT","anagrafica.Sesso":"M"},"1155":{"pettorale":"1155","nome":"Sassolini Vittorio","nazione":"IT","anagrafica.Sesso":"M"},"1156":{"pettorale":"1156","nome":"PEREZ LOPEZ OSCAR","nazione":"ES","anagrafica.Sesso":"M"},"1157":{"pettorale":"1157","nome":"regis gasperi","nazione":"FR","anagrafica.Sesso":"M"},"1158":{"pettorale":"1158","nome":"Mangano Luciano","nazione":"IT","anagrafica.Sesso":"M"},"1159":{"pettorale":"1159","nome":"Arkoumanis Fanis","nazione":"GR","anagrafica.Sesso":"M"},"1160":{"pettorale":"1160","nome":"MINOGGIO STEFANO","nazione":"AT","anagrafica.Sesso":"M"},"1161":{"pettorale":"1161","nome":"ciocchetti ernesto","nazione":"IT","anagrafica.Sesso":"M"},"1162":{"pettorale":"1162","nome":"MINOGGIO SERGIO","nazione":"IT","anagrafica.Sesso":"M"},"1163":{"pettorale":"1163","nome":"Timo de Boer","nazione":"NL","anagrafica.Sesso":"M"},"1164":{"pettorale":"1164","nome":"custodero alberto","nazione":"IT","anagrafica.Sesso":"M"},"1165":{"pettorale":"1165","nome":"bryant patty","nazione":"US","anagrafica.Sesso":"F"},"1166":{"pettorale":"1166","nome":"Dozier Tawnya ","nazione":"US","anagrafica.Sesso":"F"},"1167":{"pettorale":"1167","nome":"Petitjacques Danilo Giuseppe","nazione":"IT","anagrafica.Sesso":"M"},"1168":{"pettorale":"1168","nome":"mataix gracia Miguel","nazione":"ES","anagrafica.Sesso":"M"},"1169":{"pettorale":"1169","nome":"plat andrea","nazione":"IT","anagrafica.Sesso":"M"},"1170":{"pettorale":"1170","nome":"Rege Morgana","nazione":"IT","anagrafica.Sesso":"F"},"1171":{"pettorale":"1171","nome":"jaccond ermando ivan","nazione":"IT","anagrafica.Sesso":"M"},"1172":{"pettorale":"1172","nome":"marzotto ita emanuela","nazione":"IT","anagrafica.Sesso":"F"},"1173":{"pettorale":"1173","nome":"BELARDINI GIANLUCA","nazione":"IT","anagrafica.Sesso":"M"},"1174":{"pettorale":"1174","nome":"STEPHANE AGNOLI","nazione":"FR","anagrafica.Sesso":"M"},"1175":{"pettorale":"1175","nome":"ARRIGONI GIULIANA","nazione":"IT","anagrafica.Sesso":"F"},"1176":{"pettorale":"1176","nome":"Wang yan","nazione":"CN","anagrafica.Sesso":"M"},"1177":{"pettorale":"1177","nome":"CASTAGNO GIORGIO","nazione":"IT","anagrafica.Sesso":"M"},"1178":{"pettorale":"1178","nome":"SECCO PAOLO","nazione":"IT","anagrafica.Sesso":"M"},"1179":{"pettorale":"1179","nome":"ZENATO MICHELE","nazione":"IT","anagrafica.Sesso":"M"},"1180":{"pettorale":"1180","nome":"Richard-Foy Marc","nazione":"FR","anagrafica.Sesso":"M"},"1181":{"pettorale":"1181","nome":"Valcauda Ivan","nazione":"IT","anagrafica.Sesso":"M"},"1182":{"pettorale":"1182","nome":"SANGIORGI GUSTAVO","nazione":"IT","anagrafica.Sesso":"M"},"1183":{"pettorale":"1183","nome":"Roscio Fabrizio","nazione":"IT","anagrafica.Sesso":"M"},"1184":{"pettorale":"1184","nome":"Cipriano  Moliner Renzo  Savino","nazione":"IT","anagrafica.Sesso":"M"},"1185":{"pettorale":"1185","nome":"Ferrari Marco","nazione":"IT","anagrafica.Sesso":"M"},"1186":{"pettorale":"1186","nome":"bruna andrea","nazione":"IT","anagrafica.Sesso":"M"},"1187":{"pettorale":"1187","nome":"iino Wataru","nazione":"JP","anagrafica.Sesso":"M"},"1188":{"pettorale":"1188","nome":"CORTINA SUBIRANA RAMON","nazione":"ES","anagrafica.Sesso":"M"},"1189":{"pettorale":"1189","nome":"Scarpellini Davide","nazione":"IT","anagrafica.Sesso":"M"},"1190":{"pettorale":"1190","nome":"perrin ivo","nazione":"IT","anagrafica.Sesso":"M"},"1191":{"pettorale":"1191","nome":"DÃ­az Lluna Rafael Luis","nazione":"ES","anagrafica.Sesso":"M"},"1192":{"pettorale":"1192","nome":"MustÃ© Guerrero Tono","nazione":"ES","anagrafica.Sesso":"M"},"1193":{"pettorale":"1193","nome":"Diemoz Paolo","nazione":"IT","anagrafica.Sesso":"M"},"1194":{"pettorale":"1194","nome":"imperial vilmo","nazione":"IT","anagrafica.Sesso":"M"},"1195":{"pettorale":"1195","nome":"Mattioda  Roberto","nazione":"IT","anagrafica.Sesso":"M"},"1196":{"pettorale":"1196","nome":"BERNARD  Agnes","nazione":"FR","anagrafica.Sesso":"F"},"1197":{"pettorale":"1197","nome":"Colombo Mauro","nazione":"IT","anagrafica.Sesso":"M"},"1198":{"pettorale":"1198","nome":"MCALLISTER MARCO SEAN","nazione":"GB","anagrafica.Sesso":"M"},"1199":{"pettorale":"1199","nome":"blanc abele","nazione":"IT","anagrafica.Sesso":"M"},"1200":{"pettorale":"1200","nome":"FREDERIC DOYEN","nazione":"FR","anagrafica.Sesso":"M"},"1201":{"pettorale":"1201","nome":"MichaÃ«l Saintviteux","nazione":"BE","anagrafica.Sesso":"M"},"1202":{"pettorale":"1202","nome":"Buglione Davide","nazione":"IT","anagrafica.Sesso":"M"},"1203":{"pettorale":"1203","nome":"ZANINI RICCARDO","nazione":"IT","anagrafica.Sesso":"M"},"1204":{"pettorale":"1204","nome":"FarÃ­ Maurizio","nazione":"IT","anagrafica.Sesso":"M"},"1205":{"pettorale":"1205","nome":"BONFIGLIOLI PIETRO","nazione":"IT","anagrafica.Sesso":"M"},"1206":{"pettorale":"1206","nome":"belfrond marco","nazione":"IT","anagrafica.Sesso":"M"},"1207":{"pettorale":"1207","nome":"Berni Marco","nazione":"IT","anagrafica.Sesso":"M"},"1208":{"pettorale":"1208","nome":"melchiorri marco","nazione":"IT","anagrafica.Sesso":"M"},"1209":{"pettorale":"1209","nome":"GREGORINI PAOLO","nazione":"IT","anagrafica.Sesso":"M"},"1210":{"pettorale":"1210","nome":"RICHET PHILIPPE","nazione":"FR","anagrafica.Sesso":"M"},"1211":{"pettorale":"1211","nome":"Ayala Iacucci Pablo","nazione":"IT","anagrafica.Sesso":"M"},"1212":{"pettorale":"1212","nome":"DANIEL HEIDECK","nazione":"DE","anagrafica.Sesso":"M"},"1213":{"pettorale":"1213","nome":"ILHWAN  WI","nazione":"KR","anagrafica.Sesso":"M"},"1214":{"pettorale":"1214","nome":"JEONGHUN KIM","nazione":"KR","anagrafica.Sesso":"M"},"1301":{"pettorale":"1301","nome":"Baker Jess","nazione":"AU","anagrafica.Sesso":"F"}}
  
  # calcolo del numero di diverse nazionalità
  #x = (v.nazione for own k, v of dataRunners)
  #x = x.unique()
  #console.log x.length
  
  # parametri da settare in fase di avvio

  start = new Date(2015, 8, 13, 10, 0, 0) # data di partenza della gara
  tempoPartenza = start.getTime() # come sopra, ma timestamp in millisecondi
  

  # le seguenti frasi sono state scritte senza dati alla mano, sono solo esemplificative
  # e non è escluso che possano variare nel tempo, cioè essere richiamate via ajax
  frasi = ["24 km D+", "815 runners", "55 countries", "332 km length", "150 hours", "2.000 volunteers"]
  
  datapath = "fixtures1.json" # da settare in avvio
  #datapath = "http://api.tordesgeants.it/api/crono"

  # roba inutile
  # next Base distance in km
  #nbd = {
  #  "B1": 17,
  #  "B3": 31.6,
  #  "B7": 15.9,
  #  "B10": 14.6,
  #  "B12": 23,
  #  "B15": 27.7,
  #  "B20": 18.9,
  #  "B22": 12.6,
  #  "B25": 25.4,
  #  "B30": 13.6,
  #  "B32": 16,
  #  "B35": 6.2,
  #  "B36": 13.8,
  #  "B38": 20.4,
  #  "B43": 14.2,
  #  "B45": 12.6,
  #  "B49": 19.6,
  #  "B53": 17,
  #  "B55": 8.1,
  #  "B56": 4.3,
  #  "B57": 0
  #}

  # ----------- FINE PARAMETRI ------------ #

  # main info #

  $( () ->
      $(".main-info").typed({
          strings: frasi,
          # typing speed
          typeSpeed: 2,
          # time before typing starts
          startDelay: 0,
          # backspacing speed
          backSpeed: 0,
          # time before backspacing
          backDelay: 10000,
          # loop
          loop: true,
          # false = infinite
          loopCount: false,
          # show cursor
          showCursor: false,
          # character for cursor
          cursorChar: "|"
      })
  )

  # --------- #



  # timer #

  span = (x) ->
    if ("" + x).length < 2 then "0" + x else x


  timer = () ->
    
    # -----
    
    now = new Date(2015, 8, 16, 20, 10, 0) 
    # una volta che la gara riparte decommentare la linea seguente
    now = new Date(1442216952000)
    
    
    # data riavvio gara - data stop gara, la data di riavvio gara deve essere modificata.
    timeToRemove = new Date(2015, 8, 16, 20, 10, 0) - new Date(2015, 8, 16, 20, 10, 0)
    
    # ---


    deltaTime = now - start - timeToRemove
    # hours
    nh = Math.floor(deltaTime / (1000 * 60 * 60))
    rh = deltaTime % (1000 * 60 * 60)
    # minutes
    nm = Math.floor(rh / (1000 * 60))
    rm = rh % (1000 * 60)
    # seconds
    ns = Math.floor(rm / 1000)
    el = d3.select(".timer span")
    #el.text(span(nh) + ":" + span(nm) + ":" + span(ns) + " Race Suspended")
    el.text(span(nh) + ":" + span(nm) + ":" + span(ns))

  chrono = (time) ->
    deltaTime = new Date(time) - start
    # hours
    nh = Math.floor(deltaTime / (1000 * 60 * 60))
    rh = deltaTime % (1000 * 60 * 60)
    # minutes
    nm = Math.floor(rh / (1000 * 60))
    rm = rh % (1000 * 60)
    # seconds
    ns = Math.floor(rm / 1000)
    span(nh) + ":" + span(nm) + ":" + span(ns)

  window.setInterval(timer, 1000)

  # ----- #

  # helper functions #

  spanText = (t) ->
    x = "                  " + t
    x[-18..]

  timeChrono = (b) ->
    if b.timeIn? then +b.timeIn * 1000 else +b.timeOut * 1000

  isMale = (p) ->
    if dataRunners[p]["anagrafica.Sesso"] == "M" then true else false

  isFemale = (p) ->
    if dataRunners[p]["anagrafica.Sesso"] == "F" then true else false

  runnerName = (p) ->
    dataRunners[p].nome

  latestTime = (dinamica) ->
    b = dinamica[dinamica.length - 1]
    timeChrono b

  latestBase = (dinamica) ->
    b = dinamica[dinamica.length - 1]
    dataBasi[b.postazione]

  restTime = (dinamica) ->
    getDeltaTime = (idBaseIn, idBaseOut) ->
      b1 = dinamica.filter (i) -> i.postazione == idBaseIn
      b2 = dinamica.filter (i) -> i.postazione == idBaseOut
      if b1.length and b2.length
        (timeChrono b2[0]) - (timeChrono b1[0])
      else 0
    # base vita 1
    d1 = getDeltaTime("B7","B8")
    # base vita 2
    d2 = getDeltaTime("B15","B16")
    # base vita 3
    d3 = getDeltaTime("B22","B23")
    # base vita 4
    d4 = getDeltaTime("B32","B33")
    # base vita 5
    d5 = getDeltaTime("B38","B39")
    # base vita 6
    d6 = getDeltaTime("B49","B50")
    # return rest time in hours
    (d1 + d2 + d3 + d4 + d5 + d6) / (1000 * 60 * 60)

  velocity = (ultimaBase, ultimoTempo, tempoDiSosta) ->
    distanzaPercorsa = ultimaBase["km"]
    ultimoTempo = (ultimoTempo - tempoPartenza) / (1000 * 60 * 60) # in ore
    tempodiCorsa = ultimoTempo - tempoDiSosta
    distanzaPercorsa / tempodiCorsa

  approxPosition = (velocity, ultimoTempo, ultimaBase) ->
    if (ultimaBase.basevita and ultimaBase.nome[-2..] == "IN")
      +ultimaBase.km
    else
      dt = ( Date.now() - ultimoTempo ) / (1000 * 60 * 60) # in ore
      dt = ( 1442216952000 - ultimoTempo ) / (1000 * 60 * 60) # in ore
      ds = velocity * dt
      if ds > +ultimaBase.next
        +ultimaBase.km + +ultimaBase.next
      else
        +ultimaBase.km + ds


  # ---------------- #


  ### LOAD JSON CHRONO ###

  d3.json datapath, (error, json) ->
    if error
      console.warn error
    data = json.filter (r) -> (r.dinamica.length > 0)
    addInfo data
    #console.log data
    visualize data

  addInfo = (data) ->
    for r in data
      r.latestTime = latestTime r.dinamica
      r.latestBase = latestBase r.dinamica
      r.restTime = restTime r.dinamica
      r.velocity = velocity(r.latestBase, r.latestTime, r.restTime)
      r.approxPosition = approxPosition(r.velocity, r.latestTime, r.latestBase)

  visualize = (data) ->

    # sort data by position
    data.sort((a,b) -> +a.posizione - +b.posizione)

    # males and females lists #
    setTopRunners = (data) ->

      # filter males and females
      malesData = data.filter((i) -> isMale(i.pettorale))[..4]
      femalesData = data.filter((i) -> isFemale(i.pettorale))[..4]
      
      enterData = (selection) ->
        item = selection.enter()
          .append("li")

        item.append("span")
          .attr("class", "posizione")
          .text((d) -> d.posizione)

        #item.append("span")
        #  .attr("class", (d) -> ("flag-icon flag-icon-" + d.nazionalità))

        item.append("span")
          .attr("class", "pettorale")
          .text((d) -> d.pettorale)
        
        item.append("span")
          .attr("class", "nome")
          .text((d) -> runnerName d.pettorale)

        item.append("span")
          .attr("class", (d) -> "info info_" + d.pettorale)
          .text("")
          .each( (d) ->
            lt = chrono d.latestTime
            lb = ""+d.latestBase.nome
            v = Math.floor(d.velocity)+" km/h"
            v = d.velocity.toFixed(1)+" km/h"
            rt = Math.floor(d.restTime)+" ore sosta"
            dis = d.latestBase.dislivelloAccumulato + " m D+"
            $(".info_" + d.pettorale).typed({
              strings: [ lt, lb, v, rt, dis ],
              # typing speed
              typeSpeed: 2,
              # time before typing starts
              startDelay: 0,
              # backspacing speed
              backSpeed: 0,
              # time before backspacing
              backDelay: 20000,
              # loop
              loop: true,
              # false = infinite
              loopCount: false,
              # show cursor
              showCursor: false,
              # character for cursor
              cursorChar: "|"
            })
          )
      
      # males
      d3.select("ul.males").selectAll("li").remove()
      males = d3.select("ul.males").selectAll("li")
        .data(malesData, (d) -> d.pettorale)
      enterData males

      
      # females
      d3.select("ul.females").selectAll("li").remove()
      females = d3.select("ul.females").selectAll("li")
        .data(femalesData, (d) -> d.pettorale)
      enterData females

    # show runners
    showRunnersOnProfile = (data) ->

      # select profile
      svg = d3.select("#viz > svg")
      width = 1197.2138
      height = 320
      svg
      .attr
        "viewBox": "0 0 " + width + " " + height
        "preserveAspectRatio": "xMidYMin slice"
        "width": "100%"
      .style
        "padding-bottom": (100 * height / width) + "%"
        "height": "1px"
        "overflow": "visible"
      profile = svg.select("#profile")

      # From Mike Bostock - http://bl.ocks.org/mbostock/1705868
      translateAlong = (path, t) ->
        l = path.getTotalLength()
        p = path.getPointAtLength(t * l)
        "translate(" + p.x + "," + p.y + ")"

      # Scale: km -> path length (assuming linear relation between bases)
      tScale = d3.scale.linear()
        .domain([0, 17, 48.6, 64.5, 79.1, 102.1, 129.8, 148.7, 161.3, 186.7, 200.3, 216.3, 222.5, 236.3, 256.7, 270.9, 283.5, 303.1, 320.1, 328.2, 332.5])
        .range([0, 19.3, 50.5, 67, 81.5, 104.2, 129.8, 146.6, 159, 186.3, 199.5, 217.5, 221.5, 236, 255.3, 271.3, 284.7, 304.3, 320.1, 328, 332.5])

      position = (r) -> 
        translateAlong(profile.node(), 1 - tScale(r.approxPosition)/332.5)

      inCorsa = data.filter (r) -> (r.stato == "In gara" and r.latestBase.nome != "Arrivo")

      # add circles (runners)
      svg.selectAll(".runner").remove()
      svg.selectAll ".runner"
        .data inCorsa
        .enter()
        .append "circle"
        .attr "class", (d) -> "runner " + "runner_" + d.posizione
        .attr "r", 3
        .attr "transform", (d) -> position(d)
      
      pulse = () ->
        #console.log this
        circle = d3.select(this)
        (repeat = () -> 
          circle = circle.transition()
              .duration(3000)
              .attr "r", 15
              .style "stroke-width", 0
            .transition()
              .duration(0)
              .attr "r", 1
              .style "stroke-width", 3
              .each("end", repeat)
        )()

      # add pulse
      svg.selectAll(".pulse").remove()
      svg.selectAll ".pulse"
        .data inCorsa[..4]
        .enter()
        .append "circle"
        .attr "class", (d) -> "pulse"
        .attr "r", 1
        .attr "transform", (d) -> position(d)
        .transition()
        .delay((d) -> +d.posizione * 500)
        .each(pulse)
      
      # runner evidenziato
      if window.pettorale
        pulse = () ->
          #console.log this
          circle = d3.select(this)
          (repeat = () -> 
            circle = circle.transition()
                .duration(1000)
                .attr "r", 15
                .style "stroke-width", 0
              .transition()
                .duration(0)
                .attr "r", 1
                .style "stroke-width", 3
                .each("end", repeat)
          )()
        datum = data.filter( (r) -> r.pettorale == window.pettorale )[0]

        svg.select(".runner.selected").remove()
        svg.append "circle"
          .attr "class", "runner selected"
          .attr "r", 3
          .attr "transform", position(datum)
        
        svg.select(".pulse_selected").remove()
        svg.append "circle"
          .attr "class", "pulse_selected"
          .attr "r", 1
          .attr "transform", position(datum)
          .transition()
          .each(pulse)

      # meteo

      meteoData = [
        {
          "b":"B3"
          "p": 12
          "v": 4
          "t": 16
        },
        {
          "b":"B7"
          "p": 12
          "v": 4
          "t": 16
        }
      ]

      findX = (path, t) ->
        l = path.getTotalLength()
        p = path.getPointAtLength(t * l)
        p.x
      
      svg.selectAll(".meteoBase").remove()
      meteoG = svg.selectAll(".meteoBase")
        .data(meteoData)
        .enter().append("g")
        .attr "class", "meteoBase"
        .attr("transform", (d) ->
          km = dataBasi[d.b]["km"]
          x = findX(profile.node(), 1 - tScale(km)/332.5) - 20
          "translate(" + x + ",30)")

      # meteoG.append("text")
      #   .text (d) -> "T: " + d.t + " C"
      #   .attr "class", "dati-meteo"
      # meteoG.append("text")
      #   .text (d) -> "W: " + d.v + " km/h"
      #   .attr "class", "dati-meteo"
      #   .attr "dy", 10
      # meteoG.append("text")
      #   .text (d) -> "P: " + d.p + " mm"
      #   .attr "class", "dati-meteo"
      #   .attr "dy", 20

      # ritirati
      
      addState = () ->
        for own k ,v of dataBasi
          v.ritirati = 0
          v.ingara = 0
      addState()

      totale = () ->
        ritirati = data.filter (r) -> r.stato.toLowerCase() == "ritirato"
        ingara = data.filter (r) -> r.stato.toLowerCase() == "in gara"
        [ritirati.length, ingara.length]

      tot = totale()

      contaRitirati = () ->
        ritirati = data.filter (r) -> r.stato.toLowerCase() == "ritirato"
        for r in ritirati
          lastBase = r.dinamica[r.dinamica.length - 1].postazione
          dataBasi[lastBase].ritirati = dataBasi[lastBase].ritirati + 1

      contaIngara = (a) ->
        ingara = data.filter (r) -> r.stato.toLowerCase() == "in gara"
        for r in ingara
          lastBase = r.dinamica[r.dinamica.length - 1].postazione
          dataBasi[lastBase].ingara = dataBasi[lastBase].ingara + 1

      contaRitirati()
      contaIngara()
      
      counts = []
      for own k, v of dataBasi
        counts.push {
          "r": v.ritirati
          "g": v.ingara
          "x": findX(profile.node(), 1 - tScale(v.km)/332.5)
        }
      counts = counts[1..] # salto la prima base (motivi grafici)

      cScale = d3.scale.linear()
        .domain [0, d3.max(counts, (e) -> d3.max([e.r, e.g]))]
        .range [0, 20]
      
      d3.select(".bottom-bars").remove()
      bars = svg.append "g"
        .attr "transform", "translate(0, 300)"
        .attr "class", "bottom-bars"
      barsRitirati = bars.append("g")
      barsIngara = bars.append("g")

      barsRitirati.selectAll "rect"
        .data counts
        .enter()
        .append "rect"
        .attr "x", (d) -> d.x
        .attr "height", (d) -> cScale(d.r)
        .attr
          "y": 0
          "width": 5
          "class": "bars-ritirati"

      barsIngara.selectAll "rect"
        .data counts
        .enter()
        .append "rect"
        .attr "x", (d) -> d.x
        .attr "height", (d) -> cScale(d.g)
        .attr "y", (d) -> -cScale(d.g)
        .attr
          "width": 5
          "class": "bars-ingara"

      bars.append "line"
        .style "stroke-dasharray", "5,5"
        .attr
          "x1": 0
          "y1": 0
          "x2": 80
          "y2": 0
          "class": "bars-zeroline"

      bars.append "text"
        .text "In Gara: " + tot[1]
        .attr
          "x": 0
          "y": 0
          "dx": 5
          "dy": -6
          "class": "bars-ingara-text"

      bars.append "text"
        .text "Ritirati: " + tot[0]
        .attr
          "x": 0
          "y": 0
          "dx": 5
          "dy": 14
          "class": "bars-ritirati-text"

    myf = () ->
      setTopRunners(data)
    
    myf()
    window.intRunn = window.setInterval( myf, 100000 )
    showRunnersOnProfile(data)


# ---------- End mainFunction ---------- #


mainFunction()
window.setInterval( mainFunction, 1000 * 60 * 10 ) # update ogni 10 minuti
window.setInterval("location.reload(true)", 3600000) # refresh ogni ora
