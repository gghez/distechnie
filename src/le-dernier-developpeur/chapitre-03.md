# Chapitre 3 — Les masques


*Acte II — Le grand mensonge*

Janvier de l'année suivante. Simon arrivait au bureau chaque matin à neuf heures et passait les dix premières minutes dans un exercice qu'il avait baptisé mentalement "le décompte".

Il comptait les postes occupés.

En janvier, ils étaient vingt-trois sur le plateau technique. En mars, dix-sept. En mai, quatorze.

Personne n'en parlait. C'était la règle tacite de Nério : on ne commentait pas les départs. Les bureaux se vidaient comme les dents tombent — un par un, presque naturellement, et on s'habituait au trou.

En février, Granet envoya un second mail. Celui-ci n'avait pas le vernis glacé du premier — quelqu'un avait dû lui dire que ça se voyait. Le style était plus rugueux, presque humain.

*« Suite aux évolutions de notre organisation, nous mettons en place un nouveau cadre de collaboration homme-IA. Chaque développeur devient référent de validation sur son périmètre. L'agent propose, l'humain valide. C'est notre engagement qualité. »*

*Human-in-the-loop*. Simon connaissait le concept. C'était la bouée de sauvetage rhétorique de toute l'industrie : l'humain reste dans la boucle, l'humain garde le contrôle, l'humain a le dernier mot.

Les titres changèrent du jour au lendemain. Rémy n'était plus "développeur back-end" — il était "référent validation back-end". Nathalie n'était plus "cheffe de projet" — elle était "coordinatrice de supervision IA". Les fiches de poste furent réécrites. Les organigrammes redessinés. L'architecture humaine de Nério se reconfigura autour d'un principe simple : les agents produisent, les humains vérifient.

Au début, tout le monde joua le jeu sincèrement. Simon le premier.

Il relisait chaque *pull request*[^pull-request-3] générée par les agents. Ligne par ligne. Il vérifiait la logique, les cas limites, la cohérence avec le reste du code. Une *review*[^review-3] qui prenait vingt minutes sur du code humain en prenait désormais deux heures sur du code d'agent — non pas parce que le code était mauvais, mais parce qu'il y en avait *tellement*. Les agents ne faisaient pas dans la dentelle. Là où un développeur aurait écrit trente lignes, l'agent en produisait deux cents : plus de tests, plus de vérifications, plus de cas couverts. Pas élégant, mais exhaustif. Un volume brut qui rendait la relecture physiquement épuisante.

Rémy tenait le même rythme. Simon le voyait, penché sur son écran, les sourcils froncés, scrollant des *diffs*[^diff-3] interminables. Il annotait, commentait, demandait des corrections. Un artisan consciencieux.

Ça dura trois semaines.

Le problème n'était pas la volonté. C'était l'arithmétique. Trois agents tournaient en parallèle sur le périmètre de Simon. Chacun produisait entre cinq et dix *pull requests* par jour. Quinze à trente relectures quotidiennes, de deux cents à cinq cents lignes chacune. La file d'attente de validation gonflait plus vite qu'il ne pouvait la vider.

Granet, lui, regardait les métriques. Le *throughput*[^throughput-3] des agents était spectaculaire — à condition que les validations suivent. Et elles ne suivaient pas. Les humains étaient devenus le goulot d'étranglement.

Un matin de mars, Simon reçut un mail de son manager : *"Les temps de validation doivent baisser. Objectif : moins de trente minutes par PR."*

Trente minutes pour relire cinq cents lignes de code qu'on n'avait pas écrit, dans une architecture qu'on maîtrisait de moins en moins parce que les agents la faisaient évoluer plus vite qu'on ne pouvait la comprendre.

Simon savait ce que ça signifiait. Tout le monde le savait.

Il commença par les tests. Les *tests unitaires*[^tests-unitaires-3], ça allait — si les tests passaient, c'est que le code marchait, non ? Pas besoin de relire chaque assertion. Puis il accéléra sur le code métier : un coup d'œil à la structure, un survol des noms de fonctions, et si rien ne sautait aux yeux — *Approve*.

Le bouton vert. *LGTM*[^lgtm-3]. *Ship it*.

Simon n'était pas le premier. Il le savait parce qu'il voyait les *reviews* des autres : approuvées en sept minutes, en quatre minutes, en deux minutes. Des records de vitesse sur des changements de huit cents lignes. Personne ne lisait plus. Tout le monde approuvait.

Rémy tint un peu plus longtemps que les autres. Simon le voyait encore scroller, encore annoter, encore commenter. Puis un matin, il le vit cliquer sur *Approve* sans avoir fait défiler jusqu'en bas de la page.

Leurs regards se croisèrent. Rémy détourna les yeux.

C'était ça, le masque. Pas la simulation de travail — personne n'était dupe. Le masque, c'était le bouton *Approve*. C'était la fiction collective que quelqu'un, quelque part, vérifiait encore ce que les machines produisaient. Que l'humain était encore dans la boucle.

Un jeudi d'avril, un bug passa en production. Un calcul de TVA inversé dans le module de facturation — le genre d'erreur qu'un œil humain aurait repérée en dix secondes. Sauf qu'aucun œil humain ne l'avait regardée. La *pull request* avait été approuvée en trois minutes par deux référents validation. Le *pipeline*[^pipeline-3] de tests automatisés était passé au vert — les tests vérifiaient que le calcul s'exécutait, pas qu'il était juste.

Le *post-mortem*[^post-mortem-3] fut une scène que Simon n'oublierait jamais. Six personnes autour d'une table, toutes avec le titre de "validateur" ou "référent", et aucune ne pouvait expliquer comment le bug était arrivé là. Parce qu'aucune n'avait lu le code.

Granet, en visio depuis son bureau, posa une seule question :

— Qui a approuvé cette *pull request* ?

Deux mains se levèrent. Personne n'ajouta rien. Granet coupa la visio sans un mot.

Le lendemain, les métriques de temps de validation disparurent du *dashboard*. Personne ne commenta.

---

Le soir, Simon appela Emeric.

— Tu fais quoi en ce moment ?

— Je suis sur une mission de trois mois. Transition digitale pour un assureur. Tu vas rire : mon job c'est de former les équipes à utiliser les agents qui vont les remplacer.

— Tu leur dis ça ?

— Non. Je leur dis que les agents vont les "assister". C'est le mot officiel. *Assister.*

Un silence.

— Emeric ?

— Ouais ?

— Chez nous, on est censés valider ce que les agents produisent. L'humain dans la boucle. Le filet de sécurité.

— Et ?

— Personne ne valide. On clique sur *Approve* et on passe au suivant. Y'a eu un bug en prod la semaine dernière. Personne n'avait lu le code.

— Évidemment.

— Comment ça, évidemment ?

— C'est partout pareil, Simon. Chez l'assureur, ils ont des "comités de validation IA". Six personnes dans une salle. L'agent génère un contrat, les six le "relisent" et le signent. Tu sais combien de temps dure la relecture ? Quarante secondes. J'ai chronométré.

Simon ne dit rien.

— Le truc, reprit Emeric, c'est que la boucle, c'est du théâtre. Tout le monde le sait. Mais si tu enlèves le théâtre, il reste quoi ? Des agents qui tournent tout seuls et des gens qui regardent. Et ça, personne n'est prêt à l'admettre.

Simon raccrocha et resta assis dans le noir.

Il pensa à Rémy qui détournait les yeux. Il pensa au bouton vert. Il pensa à toutes les lignes de code qui défilaient, jour après jour, que personne ne lisait, dans des systèmes que personne ne comprenait plus vraiment.

Le masque n'était pas que tout allait bien.

Le masque, c'était que quelqu'un vérifiait encore.

---

[^pull-request-3]: **Pull request** *(ou merge request)* : demande d'intégration de modifications dans le code principal, soumise à relecture par d'autres développeurs.
[^review-3]: **Review** *(code review)* : relecture du code par un pair avant intégration — en théorie un filet de sécurité, en pratique un tampon de plus en plus formel.
[^diff-3]: **Diff** : affichage des différences entre deux versions d'un fichier de code, ligne par ligne.
[^throughput-3]: **Throughput** : débit de production — ici, le nombre de tâches que les agents terminent par unité de temps.
[^tests-unitaires-3]: **Tests unitaires** : petits programmes automatisés qui vérifient qu'un morceau de code fonctionne correctement.
[^lgtm-3]: **LGTM** : *Looks Good To Me* — formule d'approbation rapide dans les *code reviews*, devenue un réflexe plus qu'un jugement.
[^pipeline-3]: **Pipeline** : chaîne automatisée de vérifications (tests, analyse de code, déploiement) déclenchée à chaque modification.
[^post-mortem-3]: **Post-mortem** : réunion d'analyse après un incident, censée identifier les causes et éviter la récidive.
