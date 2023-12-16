class RecipePrismicResponse {
  final String id;
  final String uid;
  final dynamic url;
  final String type;
  final String href;
  final List<dynamic> tags;
  final String firstPublicationDate;
  final String lastPublicationDate;
  final List<dynamic> slugs;
  final List<dynamic> linkedDocuments;
  final String lang;
  final List<dynamic> alternateLanguages;
  final Data data;

  RecipePrismicResponse({
    required this.id,
    required this.uid,
    required this.url,
    required this.type,
    required this.href,
    required this.tags,
    required this.firstPublicationDate,
    required this.lastPublicationDate,
    required this.slugs,
    required this.linkedDocuments,
    required this.lang,
    required this.alternateLanguages,
    required this.data,
  });

  RecipePrismicResponse copyWith({
    String? id,
    String? uid,
    dynamic url,
    String? type,
    String? href,
    List<dynamic>? tags,
    String? firstPublicationDate,
    String? lastPublicationDate,
    List<dynamic>? slugs,
    List<dynamic>? linkedDocuments,
    String? lang,
    List<dynamic>? alternateLanguages,
    Data? data,
  }) =>
      RecipePrismicResponse(
        id: id ?? this.id,
        uid: uid ?? this.uid,
        url: url ?? this.url,
        type: type ?? this.type,
        href: href ?? this.href,
        tags: tags ?? this.tags,
        firstPublicationDate: firstPublicationDate ?? this.firstPublicationDate,
        lastPublicationDate: lastPublicationDate ?? this.lastPublicationDate,
        slugs: slugs ?? this.slugs,
        linkedDocuments: linkedDocuments ?? this.linkedDocuments,
        lang: lang ?? this.lang,
        alternateLanguages: alternateLanguages ?? this.alternateLanguages,
        data: data ?? this.data,
      );

  factory RecipePrismicResponse.fromJson(Map<String, dynamic> json) {
    return RecipePrismicResponse(
      id: json['id'] as String,
      uid: json['uid'] as String,
      url: json['url'], // Assuming 'url' can be of any type
      type: json['type'] as String,
      href: json['href'] as String,
      tags: (json['tags'] as List<dynamic>?) ?? [],
      firstPublicationDate: json['firstPublicationDate'] ?? '',
      lastPublicationDate: json['lastPublicationDate'] ?? '',
      slugs: (json['slugs'] as List<dynamic>?) ?? [],
      linkedDocuments: (json['linkedDocuments'] as List<dynamic>?) ?? [],
      lang: json['lang'] as String,
      alternateLanguages: (json['alternateLanguages'] as List<dynamic>?) ?? [],
      data: Data.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'url': url,
      'type': type,
      'href': href,
      'tags': tags,
      'firstPublicationDate': firstPublicationDate,
      'lastPublicationDate': lastPublicationDate,
      'slugs': slugs,
      'linkedDocuments': linkedDocuments,
      'lang': lang,
      'alternateLanguages': alternateLanguages,
      'data': data.toJson(),
    };
  }
}

class Data {
  final List<Description> title;
  final String category;
  final List<Description> description;
  final List<Ingredient> ingredients;
  final List<Instruction> instructions;
  final PrismicImage image;
  final int preparationTime;
  final int cookingTime;
  final int serves;
  final List<RelatedRecipeElement> relatedRecipes;

  Data({
    required this.title,
    required this.category,
    required this.description,
    required this.ingredients,
    required this.instructions,
    required this.image,
    required this.preparationTime,
    required this.cookingTime,
    required this.serves,
    required this.relatedRecipes,
  });

  Data copyWith({
    List<Description>? title,
    String? category,
    List<Description>? description,
    List<Ingredient>? ingredients,
    List<Instruction>? instructions,
    PrismicImage? image,
    int? preparationTime,
    int? cookingTime,
    int? serves,
    List<RelatedRecipeElement>? relatedRecipes,
  }) =>
      Data(
        title: title ?? this.title,
        category: category ?? this.category,
        description: description ?? this.description,
        ingredients: ingredients ?? this.ingredients,
        instructions: instructions ?? this.instructions,
        image: image ?? this.image,
        preparationTime: preparationTime ?? this.preparationTime,
        cookingTime: cookingTime ?? this.cookingTime,
        serves: serves ?? this.serves,
        relatedRecipes: relatedRecipes ?? this.relatedRecipes,
      );
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      title: (json['title'] as List<dynamic>?)
              ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      category: json['category'] as String,
      description: (json['description'] as List<dynamic>?)
              ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      ingredients: (json['ingredients'] as List<dynamic>?)
              ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      instructions: (json['instructions'] as List<dynamic>?)
              ?.map((e) => Instruction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      image: PrismicImage.fromJson(json['image'] as Map<String, dynamic>),
      preparationTime: json['preparationTime'] ?? 0,
      cookingTime: json['cookingTime'] ?? 0,
      serves: json['serves'] ?? 0,
      relatedRecipes: (json['relatedRecipes'] as List<dynamic>?)
              ?.map((e) =>
                  RelatedRecipeElement.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title.map((e) => e.toJson()).toList(),
      'category': category,
      'description': description.map((e) => e.toJson()).toList(),
      'ingredients': ingredients.map((e) => e.toJson()).toList(),
      'instructions': instructions.map((e) => e.toJson()).toList(),
      'image': image.toJson(),
      'preparationTime': preparationTime,
      'cookingTime': cookingTime,
      'serves': serves,
      'relatedRecipes': relatedRecipes.map((e) => e.toJson()).toList(),
    };
  }
}

class Description {
  final String type;
  final String text;
  final List<dynamic> spans;
  final String direction;

  Description({
    required this.type,
    required this.text,
    required this.spans,
    required this.direction,
  });

  Description copyWith({
    String? type,
    String? text,
    List<dynamic>? spans,
    String? direction,
  }) =>
      Description(
        type: type ?? this.type,
        text: text ?? this.text,
        spans: spans ?? this.spans,
        direction: direction ?? this.direction,
      );

  factory Description.fromJson(Map<String, dynamic> json) {
    return Description(
      type: json['type'] as String,
      text: json['text'] as String,
      spans: (json['spans'] as List<dynamic>?) ?? [],
      direction: json['direction'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'text': text,
      'spans': spans,
      'direction': direction,
    };
  }
}

class PrismicImage {
  final Dimensions dimensions;
  final String alt;
  final dynamic copyright;
  final String url;
  final String id;
  final Edit edit;

  PrismicImage({
    required this.dimensions,
    required this.alt,
    required this.copyright,
    required this.url,
    required this.id,
    required this.edit,
  });

  PrismicImage copyWith({
    Dimensions? dimensions,
    String? alt,
    dynamic copyright,
    String? url,
    String? id,
    Edit? edit,
  }) =>
      PrismicImage(
        dimensions: dimensions ?? this.dimensions,
        alt: alt ?? this.alt,
        copyright: copyright ?? this.copyright,
        url: url ?? this.url,
        id: id ?? this.id,
        edit: edit ?? this.edit,
      );

  factory PrismicImage.fromJson(Map<String, dynamic> json) {
    return PrismicImage(
      dimensions:
          Dimensions.fromJson(json['dimensions'] as Map<String, dynamic>),
      alt: json['alt'] as String,
      copyright: json['copyright'],
      url: json['url'] as String,
      id: json['id'] as String,
      edit: Edit.fromJson(json['edit'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dimensions': dimensions.toJson(),
      'alt': alt,
      'copyright': copyright,
      'url': url,
      'id': id,
      'edit': edit.toJson(),
    };
  }
}

class Dimensions {
  final int width;
  final int height;

  Dimensions({
    required this.width,
    required this.height,
  });

  Dimensions copyWith({
    int? width,
    int? height,
  }) =>
      Dimensions(
        width: width ?? this.width,
        height: height ?? this.height,
      );

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      width: json['width'] as int,
      height: json['height'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'width': width,
      'height': height,
    };
  }
}

class Edit {
  final int x;
  final int y;
  final int zoom;
  final String background;

  Edit({
    required this.x,
    required this.y,
    required this.zoom,
    required this.background,
  });

  Edit copyWith({
    int? x,
    int? y,
    int? zoom,
    String? background,
  }) =>
      Edit(
        x: x ?? this.x,
        y: y ?? this.y,
        zoom: zoom ?? this.zoom,
        background: background ?? this.background,
      );

  factory Edit.fromJson(Map<String, dynamic> json) {
    return Edit(
      x: json['x'] as int,
      y: json['y'] as int,
      zoom: json['zoom'] as int,
      background: json['background'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'x': x,
      'y': y,
      'zoom': zoom,
      'background': background,
    };
  }
}

class Ingredient {
  final List<Description> ingredient;
  final List<Description> quantity;

  Ingredient({
    required this.ingredient,
    required this.quantity,
  });

  Ingredient copyWith({
    List<Description>? ingredient,
    List<Description>? quantity,
  }) =>
      Ingredient(
        ingredient: ingredient ?? this.ingredient,
        quantity: quantity ?? this.quantity,
      );

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      ingredient: (json['ingredient'] as List<dynamic>?)
              ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      quantity: (json['quantity'] as List<dynamic>?)
              ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ingredient': ingredient.map((e) => e.toJson()).toList(),
      'quantity': quantity.map((e) => e.toJson()).toList(),
    };
  }
}

class Instruction {
  final List<Description> step;

  Instruction({
    required this.step,
  });

  Instruction copyWith({
    List<Description>? step,
  }) =>
      Instruction(
        step: step ?? this.step,
      );

  factory Instruction.fromJson(Map<String, dynamic> json) {
    return Instruction(
      step: (json['step'] as List<dynamic>?)
              ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'step': step.map((e) => e.toJson()).toList(),
    };
  }
}

class RelatedRecipeElement {
  final RelatedRecipeRelatedRecipe relatedRecipe;

  RelatedRecipeElement({
    required this.relatedRecipe,
  });

  RelatedRecipeElement copyWith({
    RelatedRecipeRelatedRecipe? relatedRecipe,
  }) =>
      RelatedRecipeElement(
        relatedRecipe: relatedRecipe ?? this.relatedRecipe,
      );

  factory RelatedRecipeElement.fromJson(Map<String, dynamic> json) {
    return RelatedRecipeElement(
      relatedRecipe: RelatedRecipeRelatedRecipe.fromJson(
        json['relatedRecipe'] as Map<String, dynamic>,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'relatedRecipe': relatedRecipe.toJson(),
    };
  }
}

class RelatedRecipeRelatedRecipe {
  final String linkType;

  RelatedRecipeRelatedRecipe({
    required this.linkType,
  });

  RelatedRecipeRelatedRecipe copyWith({
    String? linkType,
  }) =>
      RelatedRecipeRelatedRecipe(
        linkType: linkType ?? this.linkType,
      );
  factory RelatedRecipeRelatedRecipe.fromJson(Map<String, dynamic> json) {
    return RelatedRecipeRelatedRecipe(
      linkType: json['linkType'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'linkType': linkType,
    };
  }
}
