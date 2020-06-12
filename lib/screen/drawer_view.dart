import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trouvetongab/screen/infos.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:trouvetongab/screen/loginn.dart';
import 'package:shared_preferences/shared_preferences.dart';



deco()async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('email');
  BuildContext context;
  Navigator.push(context,
    MaterialPageRoute(builder: (context) => Loginn()),
  );
}

class DrawerView extends StatelessWidget {

  String apropos ="Créée par la jeune Fintech Digitale Finances, TROUVE TON GAB est un service innovant, performant et intuitif qui vous permet d’informer les clients  (de toutes les banques ) de la disponibilité de leur GAB/DAB  en live en plus de leur géolocalisation, et ce , depuis votre smartphone ou tablette. \n" +
      "TTG permet également la géolocalisation des agences bancaires de toutes les banques locales.\n" +
      "\n" +
      "L’appli TTG vous offre une multitude de fonctionnalités à portée de main telles \n" +
      "-\tl’ activation /désactivation des cartes bancaire ; \n" +
      "-\tla déclaration d’incidents de payement ( opposition sur carte bancaire, cas de réclamation de débit à tort ,etc ) ;\n" +
      "-\tLa personnalisation de – plafonds de vos cartes de débit ;\n" +
      "\n" +
      "TTG vous permet d’optimiser vos déplacements à partir d’informations reçues en temps réel 24/7.\n" +
      "\n" +
      "En plus d’être rapide et efficace, l’Appli TTG  vous garantit :\n" +
      "•\tSécurité : cryptage des données et respect des plus hauts standards bancaires\n" +
      "•\tMobilité: service disponible à tout moment et n’importe où.\n" +
      "•\tFiabilité: solution bancaire à la pointe de la technologie.\n" +
      "•\tSimplicité: utilisation facile et conviviale des fonctionnalités\n" +
      "•\t\n" +
      "Besoin d’information ou d’assistance ?\n" +
      "Pour tout savoir sur l’appli TROUVE TON GAB (TTG) , contactez-nous via le Call Center au +20003396 , le Chat Bot (site web et facebook messenger) ;whatsapp :50252526 ou par email : info@digitalefinances.com\n";

  String mentions = "•\tIdentité\n" +
      "Dénomination sociale de l’éditeur :DIGITALE FINANCES\n" +
      "Statut société : Société à responsabilité limitée au capital de 10 000 000 Francs CFA\n" +
      "RCCM :Abidjan  CI-ABJ-2019-B-17722\n" +
      "\n" +
      "SIEGE SOCIAL LEGAL: COCODY LES 2 PLTX ENA-RUEK22-TEL\n" +
      "TEL:00 225 20 00 33 96\n" +
      "ADRESSE WEB : www.digitalefinances.com\n" +
      "\n" +
      "Représentant legal : M.Mamadou DIARRASSOUBA\n" +
      "\n" +
      "•\tRègles professionnelles\n" +
      "TROUVE TON GAB est un service innovant, performant et intuitif qui vous permet d’informer les clients  (de toutes les banques ) de la disponibilité de leur GAB/DAB  en live en plus de leur géolocalisation, et ce , depuis votre smartphone ou tablette. \n" +
      "TTG permet également la géolocalisation des agences bancaires de toutes les banques locales.\n";

  String cgu = "ARTICLE 1 – DEFINITIONS \n" +
      "\n" +
      "Aux fins des présentes, on entend par :\n" +
      "\n" +
      "Application TTG : l’application mobile de Digitale Finances dénommée TROUVE TON GAB (TTG) \n" +
      "\n" +
      "Conditions Générales d’Utilisation ou CGU : les présentes conditions générales d’utilisation de l’Application Mobile Banking.\n" +
      "\n" +
      "Contrat : les présentes CGU ainsi que leurs annexes et/ou Conditions Particulières, conclues entre Digitale Finances  et l’Utilisateur. \n" +
      "\n" +
      "Données d’Identification : les données permettant à l’Utilisateur d’accéder à son Espace Personnel, composées selon le cas d’un numéro de téléphone, adresse mail.\n" +
      "\n" +
      "Données Personnelles : toutes les informations à caractère personnel concernant un Utilisateur.\n" +
      "\n" +
      "Espace Personnel : l’espace dédié de l’Utilisateur dans l’Application TTG.\n" +
      "\n" +
      "Services : les services actuels et futurs mis à la disposition de l’Utilisateur à travers l’Application TTG\n" +
      "\n" +
      "Utilisateur : la personne physique majeure et capable qui est détenteur d’un moyen de payement électronique (cartes bancaires, wallet to bank ,etc) , client ou non d’une banque de la place et qui utilise tout ou partie des Services.\n" +
      "\n" +
      "ARTICLE 2 – OBJET \n" +
      "\n" +
      "Les présentes Conditions Générales d’Utilisation régissent les relations contractuelles entre Digitale Finances et l’Utilisateur dans le cadre de l’Application TTG  et définissent les conditions et modalités du service. \n" +
      "\n" +
      "Les CGU constituent, avec, le cas échéant, les annexes et d’éventuelles Conditions Particulières, les documents contractuels qui s’imposent à l’Utilisateur. Si une ou plusieurs clauses de ces documents devaient être déclarées nulles, invalides ou sans effet, et pour quelque cause que ce soit, les autres clauses garderont toutefois leur plein effet.\n" +
      "\n" +
      "\n" +
      "\n" +
      "\n" +
      "\n" +
      "\n" +
      "ARTICLE 3 – DESCRIPTION DES SERVICES OFFERTS PAR L’APPLICATION MOBILE BANKING\n" +
      "\n" +
      "TROUVE TON GAB est un service innovant, performant et intuitif qui vous permet d’informer les clients  (de toutes les banques ) de la disponibilité de leur GAB/DAB  en live en plus de leur géolocalisation, et ce , depuis votre smartphone ou tablette. \n" +
      "TTG permet également la géolocalisation des agences bancaires de toutes les banques locales.\n" +
      "\n" +
      "\n" +
      "ARTICLE 4 – SOUSCRIPTION - ABONNEMENT\n" +
      "\n" +
      "\uF0A7\tLa souscription à l’Application se fait sur le site institutionnel de Digitale Finances (www.digitalefinances.com/trouvetongab  ou depuis les plateformes de téléchargement d’application en ligne que sont l’App Store ou Google Play et l’installer sur son appareil mobile.\n" +
      "\n" +
      " \n" +
      "La souscription peut également se faire à distance en suivant les étapes suivantes :\n" +
      "\n" +
      "\uF0A7\tTélécharger l’Application TTG depuis les plateformes de téléchargement d’application en ligne que sont l’App Store ou Google Play et l’installer sur son appareil mobile.\n" +
      "\uF0A7\tAccepter les présentes CGU en cliquant sur la case « j’accepte les CGU envoyée sous forme de cookies ;\n" +
      "\uF0A7\tChoisir sa banque pour voir les GAB/DAB ou agences bancaires disponibles avec leurs géolocalisation et les horaires d’ouverture et fermeture ;\n" +
      "\n" +
      "\n" +
      "\n" +
      "ARTICLE 5 – SAISIE DES INFORMATIONS D’IDENTIFICATION\n" +
      "\n" +
      "La saisie par l’Utilisateur et la validation des informations d’identification, par Digitale Finances, emporte automatiquement la synchronisation, sur le profil créé, de toutes les informations liées aux comptes de l’Utilisateur qu’il a entendu associer à l’Application.\n" +
      "\n" +
      "Les informations relatives aux comptes de l’Utilisateur sont actualisées de manière automatique.\n" +
      "\n" +
      "ARTICLE 6 – ACCES AUX SERVICES\n" +
      "\n" +
      "Pour avoir accès aux Services, l’Utilisateur se connecte à l’Application en renseignant ses Données d’Identification.\n" +
      "\n" +
      "Lorsque l’Utilisateur est connecté, s’il ne se déconnecte pas manuellement, il reste connecté, même s’il n’est plus dans l’Application.\n" +
      "\n" +
      "Si l’Utilisateur se déconnecte manuellement de l’Application, il devra à nouveau renseigner ses Données d’Identification pour accéder à nouveau à son profil.\n" +
      "\n" +
      "ARTICLE 7 – SECURITE\n" +
      " \n" +
      "Les Données d’Identification sont définies par l’Utilisateur au moment de sa souscription.\n" +
      "\n" +
      "L’Utilisateur s’oblige à prendre toutes les mesures et précautions propres à assurer la sécurité de son appareil mobile, de ses Données d’Identification et de ses informations relatives à ses opérations sur son profil. Il s’oblige à les tenir absolument secrètes et à ne les divulguer à personne sous aucun prétexte.\n" +
      "\n" +
      "Tout accès au profil de l’Utilisateur au moyen de ses Données d’Identification, est présumé de son fait. \n" +
      "\n" +
      "Digitale Finances  s’oblige à faire tout son possible en vue d’assurer la sécurité du profil et des Données d’Identification de l’Utilisateur.\n" +
      "\n" +
      "Compte tenu toutefois de la complexité de l’environnement internet et des systèmes d’information, Digitale Finances n’est tenue, au titre de son engagement de sécurisation du profil et des Données d’Identification de l’Utilisateur, qu’à une obligation de moyen.\n" +
      "\n" +
      "Tout accès frauduleux au profil et aux Données d’Identification de l’Utilisateur, toute altération de son profil, sont interdits et feront l’objet de poursuites judiciaires.\n" +
      "\n" +
      "L’ensemble des informations, incluant les informations des opérations exécutées par l’Utilisateur, est conservé sous la responsabilité de Digitale Finances qui en garantit l’intégrité. \n" +
      "\n" +
      "L’Utilisateur s’engage à ne commettre aucun acte qui pourrait mettre en cause la sécurité des systèmes d’information de Digitale Finances.\n" +
      "\n" +
      "Il est interdit à l’Utilisateur d’accéder aux Services de l’Application TTG  sur un appareil mobile dont il n’est pas propriétaire ou dont l’usage est partagé avec une tierce personne.\n" +
      "\n" +
      "\n" +
      "\n" +
      "ARTICLE 8 – DISPONIBILITE DE L’APPLICATION TTG\n" +
      "\n" +
      "L’Application et les Services sont en principe disponible 24 heures/24 et 7 jours sur 7. \n" +
      "\n" +
      "En cas de panne, de maintenance ou de mise à jour des systèmes, l’accès à l’Application est suspendu temporairement. L’Utilisateur en sera notifié sur son appareil mobile.\n" +
      "\n" +
      "ARTICLE 9 – PROPRIETE INTELLECTUELLE \n" +
      "\n" +
      "L’Application Mobile Banking, l’ensemble des Services et chacun des éléments qui lui sont associés pour sa fonctionnalité (les programmes et fichiers informatiques, les logiciels, progiciels interfaces, base de données, savoir-faire, données, textes, articles, lettres d’informations, communiqués, présentations, brochures, illustrations, photographies, animations, et toutes autres informations, sans que cette liste soit limitative) sont la propriété intellectuelle exclusive de Digitale Finances.\n" +
      "L’utilisation de l’Application, objet des présentes conditions générales, ne confère nullement à l’Utilisateur, un quelconque droit de propriété, de quelque nature que ce soit et la mise à disposition des services dédiés, ne saurait s’analyser en un transfert quelconque de propriété au profit de l’Utilisateur.\n" +
      "\n" +
      "L’Utilisateur s’interdit donc de vendre, prêter, nantir, licencier, reproduire, diffuser, communiquer au public, commercialiser, louer, adapter, modifier, transformer, décompiler tout élément de l’Application, dans sa forme originale ou dans une forme modifiée. \n" +
      "\n" +
      "L'Utilisateur s'engage expressément à ce que l'utilisation de l'Application ne porte en aucun cas atteinte aux droits de Digitale Finances, et notamment à ce que cette utilisation ne constitue pas un acte de contrefaçon, de concurrence déloyale ou parasitaire de l’Application ou de son contenu.\n" +
      "\n" +
      "ARTICLE 10 – PROTECTION DES DONNEES A CARACTERE PERSONNEL\n" +
      "\n" +
      "L’Utilisateur reconnait que Digitale Finances est amenée à collecter des données à caractère personnel le concernant à l’occasion de la conclusion et de l’exécution des présentes. \n" +
      " \n" +
      "Ces données feront l’objet de traitement afin de permettre la gestion de la relation Client et des Services offerts par l’Application, la gestion des risques, la prévention de la fraude, la mise en place d’actions commerciales et le respect des obligations légales et règlementaires.\n" +
      "\n" +
      "L’Utilisateur autorise, de convention expresse, Digitale Finances à collecter, traiter et communiquer les données à caractère personnel pour son compte ou celui des prestataires et sous-traitants qui interviennent pour son compte.\n" +
      " \n" +
      "L’Utilisateur peut s’opposer, pour des motifs légitimes, à ce que les données à caractère personnel fassent l’objet de tels traitements.\n" +
      "\n" +
      "\n" +
      "ARTICLE 11 - LUTTE CONTRE LA FRAUDE, LE BLANCHIMENT DE CAPITAUX ET LE FINANCEMENT DU TERRORISME\n" +
      "\n" +
      "Digitale Finances se réserve le droit de ne pas exécuter toute opération qu’elle jugerait non conforme.\n" +
      "\n" +
      "\n" +
      "ARTICLE 12 - RESPONSABILITE DE DIGITALE FINANCES\n" +
      "\n" +
      "Digitale Finances est responsable de la fourniture des Services offerts par l’Application Mobile Banking, laquelle est limitée aux seuls dommages directs subis par l’Utilisateur à raison de l’utilisation de l’Application.\n" +
      "\n" +
      "Digitale Finances ne peut être tenue responsable de tous dommages indirects causés à l’Utilisateur, comme la perte de clientèle, la perte de profit, le manque à gagner ou l’atteinte à son image.\n" +
      " Digitale Finances ne pourra être tenue responsable en cas de dommage subi par l’Utilisateur et résultant de :\n" +
      "- Une faute de l’Utilisateur ;\n" +
      "- Un non-respect par l’Utilisateur des conditions générales d’utilisation ;\n" +
      "- L'accès par un tiers à ses informations d’identification sur autorisation de l’Utilisateur ;\n" +
      "- L’usage frauduleux ou abusif de l’Application Mobile Banking par l’Utilisateur ;\n" +
      "- L’interruption ou la défaillance de l’Application, suite à des dysfonctionnements du réseau Internet, du réseau des télécommunications ou du réseau informatique ;\n" +
      "- L’impossibilité de fournir les Services offerts par l’Application, notamment, en cas d’indisponibilité de la connexion ou pour des raisons indépendantes de la volonté de Digitale Finances;\n" +
      "\n" +
      "ARTICLE 13 - RESPONSABILITE DE L’UTILISATEUR\n" +
      "\n" +
      "L’Utilisateur s’oblige à utiliser l’Application et les Services offerts dans le respect des stipulations des conditions générales d’utilisation ainsi que de la règlementation en vigueur.\n" +
      "\n" +
      "L’Utilisateur est responsable de la bonne exécution des obligations qui lui incombent en vertu des présentes conditions générales d’utilisation.\n" +
      "\n" +
      "Il est responsable de tous dommages et intérêts qui pourraient être réclamés par tout tiers à Digitale Finances , ainsi que de toute plainte, actions, poursuite ou condamnation de Digitale Finances, en cas de non-respect par lui, d’une ou plusieurs obligations découlant des conditions générales d’utilisation et s’oblige à indemniser Digitale Finances.\n" +
      "\n" +
      "ARTICLE 14 – DURÉE  \n" +
      "\n" +
      "Les présentes conditions générales d’utilisation sont édictées pour une durée indéterminée à compter de leur acceptation par l'Utilisateur.\n" +
      "\n" +
      "ARTICLE 15 - RESILIATION \n" +
      "\n" +
      "15.1\tL’Utilisateur peut résilier, à tout moment, sans frais, son abonnement en notifiant sa décision à Digitale Finances, par tout moyen laissant trace écrite.\n" +
      "\n" +
      "15.2\t Digitale Finances  peut résilier le contrat en respectant un préavis d'au moins un (01) mois. Elle informe l’utilisateur par tout moyen laissant trace écrite et notamment par courrier électronique.\n" +
      "\n" +
      "Toutefois, Digitale Finances se réserve le droit de procéder à la résiliation, sans préavis, en cas de liquidation des biens de l’Utilisateur, de fraude, d’usage abusif de l’Application, à des fins notamment de blanchiment de capitaux, de financement du terrorisme et en cas de violation par l’Utilisateur de ses obligations contenu dans les présentes conditions générales d’utilisation.\n" +
      " \n" +
      "ARTICLE 16 – CONDITIONS FINANCIÈRES\n" +
      "\n" +
      "L’Application Mobile Banking est fournie gratuitement à l’Utilisateur dès son lancement mais pourrait à terme connaître une facturation selon l’ évolution des différents services associés.\n" +
      " \n" +
      "L’accès à l’ensemble des Services tel que mentionné à l’article 3 ci-dessus est également gratuit pour l’Utilisateur.\n" +
      "\n" +
      "\n" +
      "ARTICLE 17 – MODIFICATIONS DES CONDITIONS GENERALES D’UTILISATION DE L’APPLICATION\n" +
      "\n" +
      "Digitale Finances  se réserve le droit d’apporter, à tout moment, des modifications, à tout ou partie des présentes conditions générales, en vue de les adapter aux évolutions de l’Application ou de l’offre de services.\n" +
      "\n" +
      "Digitale Finances notifiera le projet des modifications à l’Utilisateur, par tout moyen laissant trace écrite et notamment par courrier électronique, en même temps que la date prévue pour leur entrée en vigueur et au plus tard un (01) mois avant. \n" +
      "\n" +
      "L’Utilisateur dispose d’un délai de quinze (15) jours à compter de la notification des modifications pour refuser celles-ci.\n" +
      "\n" +
      "L’Utilisateur est réputé avoir accepté les modifications s'il n’a pas notifié son refus à Digitale Finances avant la date d'entrée en vigueur proposée de ces modifications.\n" +
      "\n" +
      "Si l’Utilisateur refuse les modifications, il peut, si bon lui semble, résilier sans frais le contrat, avant la date d'entrée en vigueur proposée des modifications.\n" +
      "\n" +
      "Si l’Utilisateur ne signifie pas son refus des modifications, et continue à utiliser l’Application et les Services offerts après la date de leur entrée en vigueur, Digitale Finances ne pourra en aucun cas, être tenue pour responsable d’un quelconque préjudice, résultant de cette utilisation.\n" +
      "\n" +
      "ARTICLE 18 - SECRET PROFESSIONNEL\n" +
      "\n" +
      "Digitale Finances est tenue au secret professionnel. Toutefois, ce secret peut être levé, conformément à la législation en vigueur, en vertu d’une obligation légale, règlementaire et prudentielle, notamment à la demande régulière des autorités de tutelle, de l’administration fiscale ou douanière, ainsi qu’à celle de toute autorité judiciaire.\n" +
      "\n" +
      "L’Utilisateur autorise Digitale Finances à communiquer les informations le concernant entreprises extérieures pour l’exécution des travaux qu’elle peut sous-traiter. Bien entendu, toutes mesures sont prises pour assurer la confidentialité des informations transmises.\n" +
      "\n" +
      "ARTICLE 19 – DROIT APPLICABLE - REGLEMENT DES DIFFERENTS\n" +
      "\n" +
      "Les présentes Conditions Générales d’Utilisation de l’Application sont régies par le droit ivoirien.\n" +
      "\n" +
      "Tout litige découlant de l’interprétation, de l’exécution ou de la rupture de celles-ci, devra faire l’objet d’un règlement amiable par voie de négociation directe entre les Parties. \n" +
      "\n" +
      "La Partie faisant état de l’existence dudit litige, devra dès qu’elle en a connaissance, le notifier à l’autre Partie par écrit en précisant sa nature et en fournissant toute autre information pertinente qu’elle jugera nécessaire à sa compréhension. \n" +
      "\n" +
      "A défaut d’accord dans un délai de trente (30) jours à compter de la date de réception, de la notification, le litige sera soumis par la partie la plus diligente, au Tribunal de Commerce d’Abidjan.\n";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // column holds all the widgets in the drawer
      child: Column(
        children: <Widget>[
          Expanded(
            // ListView contains a group of widgets that scroll inside the drawer
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image(image: AssetImage('assets/images/Favicon_trouve_ton_gab.png'),width: MediaQuery.of(context).size.width/5,),
                        Text("Trouve ton GAB", textAlign: TextAlign.center, style: TextStyle(fontSize: 20), ),
                        Text("By Digitale Finances", textAlign: TextAlign.center, style: TextStyle(fontSize: 11),
                        ),

                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                  ),
                ),
                ListTile(
                  title: Text('A propos'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Infos("A propos", apropos)));
                  },
                ),
                ListTile(
                  title: Text('Mentions légales'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Infos("Mentions légales", mentions)));
                  },
                ),
                ListTile(
                  title: Text('Conditions d\'utilisation'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Infos("Conditions générales d\'utilisation (CGU)", cgu)));
                  },
                ),
                ListTile(
                  title: Text('Digitale Finances'),
                  onTap: _markertplaceUrl,
                ),
                ListTile(
                  title: Text('Se déconnecter'),
                  onTap: () {
                    // Update the state of the app.
                    deco();
                  },
                ),
              ],
            ),
          ),
          // This container holds the align
          Container(
            padding: EdgeInsets.only(left: 15, bottom: 15),
            // This align moves the children to the bottom
            child: Align(
                alignment: FractionalOffset.bottomLeft,
                // This container holds all the children that will be aligned
                // on the bottom and should not scroll with the above ListView
                child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Version : 1.0.0\nPropriété de Digitale Finances\nTous droits reservés"),
                        Image(image: AssetImage("assets/images/df_logo.png"), width: MediaQuery.of(context).size.width/3,),
                      ],
                    ),
                )
            )
          )
        ],
      ),
    );
  }

  _markertplaceUrl() async{
    const url = 'https:www.digitalefinances.com';
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw 'Could not launch $url';
    }
  }
}
