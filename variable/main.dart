// Declarations de Variables

var x = 5;

// Dans Dart, ce code attribue la valeur 5 à la variable x. De même, l'exemple suivant affecte le littéral de chaîne
// "antilope" aux variables animal.

var animal = "antelope";

/*
Dans l'exemple suivant, la variable mycoolWord reçoit la valeur de la chaîne littérale "antilope". Les variables peuvent
ont aussi un type. Pour l'instant, vous pouvez considérer un type comme un moyen d'insister sur le fait qu'une variable ne contient qu'un type spécifique de valeur,
même si ce n'est pas tout à fait exact. mycoolWord est spécifié comme étant de type String
*/
String mycoolWord = "other antelope";

// Programme principal
void main(List<String> args) {
  // rar x
  print(x);
  // var animal
  print(animal);

  // mycoolWord

  print(mycoolWord);

  mycoolWord = "dog";

  // Nous pouvons maintenant réaffecter à mycoolWord une autre valeur de type String.

  print(mycoolWord);

  // Mais, nous ne pouvons pas attribuer un non-String à mycoolWord.

  // mycoolWord = 5; //WRONG - Cela déclenchera un avertissement.

  /*

  NB:
    Les types sont facultatifs dans Dart. Cependant, ils sont utiles lorsque nous voulons assurer la sécurité de certaines de nos variables
    en imposant un type spécifique. Les types sont également utiles lors du débogage. Non, nous ne voulons pas faire de division sur le mot
    "antilope"! nous ferons un usage intensif des types, car ils peuvent fournir un niveau de clarté rassurant pour
    un nouveau programmeur et peut sans doute être considéré comme la meilleure pratique.*/

/*
    Il existe six types spéciaux dans Dart qui sont fondamentaux 
    pour le langage et peuvent être décrits avec des littéraux. Ce sont des entiers, des nombres à virgule flottante, des chaînes, des booléens, des listes et des cartes. 
    Nous avons déjà vu quelques exemples d'entiers et de chaînes. Nous en apprendrons plus dans ce chapitre sur les deux. 
    Les listes et les Maps sont le sujet principal et des booléens */
}
