# Chapitre 1 — Cassandre


*Acte I — Les signaux*

— Eh Nico, t'as vu ? L'agent a *refacto*[^refacto] tout le module de paiement pendant ta pause clope.

— Nique sa mère. Il a touché à mes tests aussi ?

— Tes tests ? Quels tests ?

Éclat de rire général. Nico leva son majeur sans quitter son écran des yeux, et Léa, deux bureaux plus loin, balança un Haribo qui atterrit pile dans son capuchon de hoodie. Applaudissements.

L'open space de Nério avait cette énergie qu'on ne trouve que dans les boîtes où les gens s'aiment bien. Trente-deux développeurs, quatorze chefs de projet, une armée de commerciaux répartis sur deux étages d'un immeuble de verre à Levallois, avec vue sur le périph et l'illusion d'être dans la cour des grands. On se vannait entre les équipes, les chefs de projet se faisaient chambrer sur leurs specs floues, les devs sur leur allergie aux réunions, et tout le monde sur la machine à café qui faisait un bruit de tracteur. C'était bruyant, bordélique, vivant.

Simon Darcy aimait cet endroit. C'est ce qui rendait la chose pire.

Sur son terminal, un agent venait de résoudre en onze secondes un bug qui lui aurait pris la matinée. Il le regardait faire, fasciné malgré lui.

Onze secondes.

Simon referma le terminal. Autour de lui, les vannes continuaient à fuser, quelqu'un avait mis de la musique, et Romain venait de se prendre un avion en papier dans la nuque. Tout allait bien. Tout avait l'air d'aller bien.

Il avait trente-quatre ans, un CDI confortable, des collègues qu'il aimait, et la certitude glacée que tout allait s'effondrer.

Ce n'était pas de la paranoïa. C'était de l'arithmétique.

Il l'avait dit à Romain, son lead. Pas de manière solennelle, pas en convoquant une réunion — juste entre deux cafés, un mardi matin, en regardant les résultats du dernier *sprint*[^sprint].

— T'as vu le temps de résolution depuis qu'on utilise les agents ? avait demandé Simon.

— Ouais. C'est dingue, non ? Romain souriait. Le sourire de celui qui voit son tableau de bord virer au vert.

— Dingue. Et tu sais ce que ça veut dire, à terme ?

— Qu'on va livrer plus vite.

— Non. Qu'on va être moins nombreux.

Romain avait ri. Le rire poli de celui qui ne veut pas entendre.

---

Simon rentrait le soir dans son deux-pièces du côté de Montreuil, et il comptait. C'était devenu un tic. Il comptait les postes, les tâches, les heures. Il faisait des estimations sur un carnet, à l'ancienne, comme si le papier rendait les chiffres moins effrayants.

Il commença par le minimum vital. Le *bus factor* : combien de personnes doivent tomber pour qu'un service s'arrête. Si la réponse est un, c'est un problème — une maladie, des vacances, une démission, un bus, et plus personne ne sait faire tourner le truc. Deux, c'est le seuil. Le minimum pour que ça tienne.

Simon lista les services de Nério. Le front. Le back. L'infra. La data. Le mobile. Les intégrations. La sécu. Sept services, fois deux. Quatorze développeurs. Sur trente-deux.

Quatorze, c'était le plancher. Le minimum en dessous duquel on ne descend pas sans risquer la panne. Les dix-huit autres, c'était du confort. De la vélocité. La capacité à livrer vite et à mener plusieurs chantiers de front. Et c'était exactement ce que les agents remplaçaient déjà.

Il en avait parlé à Joachim un soir, au téléphone. Joachim, son ami de prépa, devenu chercheur en biophysique, l'esprit toujours ailleurs, perdu entre ses protéines et ses publications.

— Tu sais ce qui me fait flipper ? avait dit Simon. C'est pas que l'IA soit intelligente. C'est qu'elle est suffisante. Suffisamment bonne. Et suffisamment bonne, dans un tableur, ça veut dire : l'humain est trop cher.

— Hmm, avait répondu Joachim. Tu as lu le papier de Nakamura sur les repliements non canoniques ? Fascinant. Les implications pour —

— Jojo. Je te parle de la fin du travail.

— Oui oui, je t'entends. Mais tu sais, les gens ont dit la même chose pour la machine à vapeur.

Simon avait raccroché avec ce mélange familier d'affection et d'exaspération. Joachim vivait dans un monde parallèle, un monde de formules et de microscopes où les agents IA n'étaient que des outils de plus, comme une pipette perfectionnée. C'était peut-être de la sagesse. Ou peut-être l'aveuglement confortable de celui qui ne regarde pas par la fenêtre.

Ce soir-là, Simon ne dormit pas.

Ce n'était pas l'insomnie habituelle — le loyer, les mails, une deadline. C'était une insomnie existentielle. Son cerveau tournait comme un moteur emballé, incapable de caler.

Il reprit le carnet. La tasse de thé sur la table basse avait refroidi depuis longtemps. Quatorze. Le plancher. Mais le plancher supposait que chaque service avait besoin d'humains pour fonctionner.

Il repensa aux tests. Aujourd'hui, c'était les QA qui vérifiaient que tout marchait. Demain — et demain, c'était dans six mois — un chef de projet lancerait un agent et lirait le rapport lui-même. Plus besoin de testeurs. La même logique valait pour la documentation, le *monitoring*[^monitoring], le support technique. Service par service, le commanditaire pouvait court-circuiter l'équipe et poser la question directement à la machine.

Quatorze devenait dix. Dix devenait six. Six devenait : pourquoi encore payer des gens ?

Il ferma le carnet. Le rouvrit. Recalcula. Ça ne changeait pas.

Ce qui le rongeait, ce n'était pas la conclusion — c'était la solitude de la conclusion. Joachim n'avait pas compris. Romain n'avait pas voulu comprendre. Et Simon n'avait personne à qui dire : la vague arrive, et tout le monde bronze sur la plage.

À trois heures du matin, il se leva et alla à la fenêtre. Montreuil dormait. Quelques lampadaires orange, un scooter au loin, le silence des rails avant le train.

---

Le lendemain au bureau, tout était normal. C'est-à-dire que tout avait l'air normal.

Nico se plaignait de la climatisation. Léa montrait une vidéo de chat sur son téléphone. Romain distribuait les tickets du sprint avec l'assurance tranquille de celui qui croit que les sprints existeront toujours.

Simon prit son café, ouvrit son terminal, lança un agent sur un module de facturation. L'agent livra en sept minutes un pavé de code — trois fois ce que Simon aurait écrit pour le même résultat. Des tests pour des cas auxquels il n'aurait pas pensé, des validations partout, de la documentation intégrée. Plus lourd que du code humain, mais plus solide aussi. Simon avait regardé les lignes défiler pendant sept minutes, incapable de décrocher. Il aurait pu lancer autre chose en parallèle, être productif. Mais c'était hypnotisant. Un feu de cheminée numérique.

Il poussa le code en *revue*[^revue]. Aucune des lignes n'était de lui, mais son nom apparaissait dessus. Ça ne gênait plus personne.

Ce qui changea d'abord, ce fut les revues de code. Un par un, sans se concerter, les développeurs avaient pris l'habitude de soumettre les contributions de leurs agents à… un autre agent. L'agent écrivait, l'agent relisait. Le cercle se fermait tout seul.

C'est Romain qui mit le doigt dessus, un matin, devant la machine à café.

— Attendez. Si c'est un agent qui écrit le code, et un agent qui le relit… nous, on sert à quoi dans la boucle ?

Silence. Léa souffla sur son café. Nico haussa les épaules.

— À cliquer sur "approuver", dit Simon.

Personne ne rit.

Le midi, ils déjeunèrent à six dans le japonais d'en bas. Nico raconta un match de foot, Romain parla de ses vacances en Crète, et Léa fit rire tout le monde avec une imitation du directeur commercial. C'était bien. C'était simple. Simon rit avec eux, sincèrement, et pendant une heure il oublia ses chiffres.

L'après-midi, un mail RH annonça le départ de Julien, un développeur junior de l'équipe data. *Julien a décidé de poursuivre de nouvelles opportunités.* La formule consacrée. Simon savait ce qu'elle signifiait : Julien n'avait rien décidé du tout.

---

Le mercredi, en *daily standup*[^daily-standup], Rémy prit la parole avec son calme habituel. Freelance *back-end*[^back-end], quarante-trois ans, posté à côté de Simon depuis deux ans — le genre de type solide qu'on imagine mal déstabilisé.

— J'ai lancé un agent sur la migration de la base clients hier soir. Ce matin, c'était fini. J'ai relu, c'est nickel.

— T'as fait ça en une soirée ? demanda Romain, impressionné.

— L'agent a fait ça en une soirée. Moi, j'ai regardé une série.

Quelques rires. Simon croisa le regard de Rémy. Il y lut quelque chose qui n'avait pas encore de nom — le vertige de celui qui vient de rendre son propre savoir-faire négligeable. Quinze ans de métier, un crédit à Cergy, deux gamins. Et une machine qui faisait le boulot pendant qu'il regardait Netflix.

Rémy ne dit rien de plus. Simon nota qu'il ne sourit plus de la journée.

---

Le jeudi soir, Simon rentra chez lui et resta debout devant sa fenêtre, sans allumer la lumière. Il pensa à Joachim et à sa machine à vapeur. Il pensa à Julien et à ses *nouvelles opportunités*. Il pensa à Rémy qui ne souriait plus.

Il envoya un message à Emeric : *On se boit une bière demain ?*

La réponse fut immédiate : *Toujours.*

---

Le lendemain soir, dans un bar du onzième — un de ces endroits bruyants où il faut crier pour se faire entendre — Simon vida son sac. Les agents, ses chiffres, le carnet, Julien, Rémy. Tout.

Emeric écouta. Il était entre deux missions, comme d'habitude. Ex-développeur reconverti chef de projet, il enchaînait les CDD et les périodes creuses depuis trois ans. Avant les agents. Avant la crise. Emeric galérait par nature, ou par malchance — Simon n'avait jamais su trancher.

— Ouais, dit Emeric en sirotant sa bière. C'est possible. Probable même.

— Et ça te fait rien ?

Emeric haussa les épaules. Pas le haussement de celui qui s'en fiche — celui de celui qui a déjà encaissé.

— Mec, moi ça fait trois ans que je cherche. Si le marché se casse la gueule, au moins je serai pas surpris. Bienvenue dans mon monde.

C'était dit sans amertume. Emeric ne faisait pas dans l'amertume.

---

Au bureau, les choses avançaient à une vitesse que Simon trouvait obscène.

En mars, Nério avait licencié les deux testeurs *QA*[^qa]. Les agents couvraient quatre-vingt-quinze pour cent des cas de test. Les cinq pour cent restants ? On verrait en *prod*[^prod]. Le lundi suivant, leurs bureaux étaient vides. Écrans éteints, chaises repoussées. Un mug *World's Okayest Tester* encore sur le plan de travail.

En avril, c'était le tour de Fatima, la rédactrice technique. Son poste avait été "réorganisé" — le mot que les RH utilisaient pour ne pas dire "supprimé". La documentation serait désormais générée automatiquement.

En mai, l'équipe de support client avait fondu de moitié. Un agent conversationnel gérait le premier et le deuxième niveau. Les humains restants ne traitaient plus que les cas "complexes" — c'est-à-dire les clients assez furieux pour exiger un être humain.

Il continuait à coder, à livrer, à faire ses daily standups.

Un soir, Léa le coinça à la sortie. Elle avait son casque autour du cou et son sac à dos déjà sur l'épaule, mais elle ne partait pas. Elle attendait que le couloir se vide.

— Simon. J'ai un truc qui me tourne dans la tête depuis des jours et j'arrive pas à m'en débarrasser.

— Vas-y.

— Le dashboard qu'on est en train de livrer. Le truc avec les graphiques, les filtres, les trois vues différentes. On y bosse depuis deux mois. Quatre devs, un designer.

— Oui, et ?

— Et un agent pourrait juste… répondre. Directement. "Montre-moi les ventes de mars par région", et il te sort exactement ce que tu veux. Pas un écran figé. Pas un format décidé six mois à l'avance. Juste la réponse.

Elle se mordit la lèvre.

— Alors à quoi ça sert, ce qu'on fait ? Pourquoi on empaquette la donnée dans des boîtes rigides alors qu'un agent peut la donner à chacun dans la forme exacte qu'il veut ?

Elle le regardait avec des yeux qui cherchaient une contradiction. Un argument. N'importe quoi pour la rassurer.

— T'as raison, dit Simon.

— Dis-moi que j'ai tort.

— Le logiciel, c'est un compromis. Entre ce que l'utilisateur veut et ce qu'on peut livrer. Le jour où l'agent donne à chacun exactement ce qu'il veut, le compromis saute.

Léa hocha la tête lentement. Pas soulagée. Pas surprise non plus. Juste quelqu'un qui entend confirmer ce qu'elle savait déjà.

— Donc on construit des trucs morts, dit-elle.

— On construit les derniers.

Elle remit son casque sur ses oreilles et partit vers le métro sans se retourner.

---

Mais chaque matin, Simon s'asseyait à son poste, regardait les bureaux qui se vidaient autour de lui, et se demandait combien de temps il faudrait avant que le sien le devienne aussi.

La réponse, il le savait, était : moins longtemps qu'il ne le croyait.

---

[^refacto]: **Refacto** *(refactoring)* : réécriture d'un morceau de code pour l'améliorer sans changer ce qu'il fait.
[^sprint]: **Sprint** : période de travail fixe (généralement deux semaines) dans les méthodes de gestion de projet agiles.
[^revue]: **Revue** *(de code)* : relecture du code par un pair avant de l'intégrer au logiciel.
[^daily-standup]: **Daily standup** : réunion quotidienne de quelques minutes où chaque membre de l'équipe résume son avancement.
[^back-end]: **Back-end** : partie invisible d'un logiciel, celle qui gère les données et la logique côté serveur.
[^qa]: **QA** *(Quality Assurance)* : tests destinés à vérifier que le logiciel fonctionne correctement avant sa mise en ligne.
[^monitoring]: **Monitoring** : surveillance automatisée du bon fonctionnement d'un système informatique en temps réel.
[^prod]: **En prod** *(en production)* : dans l'environnement réel, utilisé par les vrais clients.
