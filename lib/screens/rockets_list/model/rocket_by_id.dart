/// height : {"meters":22.25,"feet":73}
/// diameter : {"meters":1.68,"feet":5.5}
/// mass : {"kg":30146,"lb":66460}
/// first_stage : {"thrust_sea_level":{"kN":420,"lbf":94000},"thrust_vacuum":{"kN":480,"lbf":110000},"reusable":false,"engines":1,"fuel_amount_tons":44.3,"burn_time_sec":169}
/// second_stage : {"thrust":{"kN":31,"lbf":7000},"payloads":{"composite_fairing":{"height":{"meters":3.5,"feet":11.5},"diameter":{"meters":1.5,"feet":4.9}},"option_1":"composite fairing"},"reusable":false,"engines":1,"fuel_amount_tons":3.38,"burn_time_sec":378}
/// engines : {"isp":{"sea_level":267,"vacuum":304},"thrust_sea_level":{"kN":420,"lbf":94000},"thrust_vacuum":{"kN":480,"lbf":110000},"number":1,"type":"merlin","version":"1C","layout":"single","engine_loss_max":0,"propellant_1":"liquid oxygen","propellant_2":"RP-1 kerosene","thrust_to_weight":96}
/// landing_legs : {"number":0,"material":null}
/// payload_weights : [{"id":"leo","name":"Low Earth Orbit","kg":450,"lb":992}]
/// flickr_images : ["https://imgur.com/DaCfMsj.jpg","https://imgur.com/azYafd8.jpg"]
/// name : "Falcon 1"
/// type : "rocket"
/// active : false
/// stages : 2
/// boosters : 0
/// cost_per_launch : 6700000
/// success_rate_pct : 40
/// first_flight : "2006-03-24"
/// country : "Republic of the Marshall Islands"
/// company : "SpaceX"
/// wikipedia : "https://en.wikipedia.org/wiki/Falcon_1"
/// description : "The Falcon 1 was an expendable launch system privately developed and manufactured by SpaceX during 2006-2009. On 28 September 2008, Falcon 1 became the first privately-developed liquid-fuel launch vehicle to go into orbit around the Earth."
/// id : "5e9d0d95eda69955f709d1eb"

class RocketById {
  RocketById({
    this.height,
    this.diameter,
    this.mass,
    this.firstStage,
    this.secondStage,
    this.engines,
    this.landingLegs,
    this.payloadWeights,
    this.flickrImages,
    this.name,
    this.type,
    this.active,
    this.stages,
    this.boosters,
    this.costPerLaunch,
    this.successRatePct,
    this.firstFlight,
    this.country,
    this.company,
    this.wikipedia,
    this.description,
    this.id,
  });

  RocketById.fromJson(dynamic json) {
    height = json['height'] != null ? Height.fromJson(json['height']) : null;
    diameter = json['diameter'] != null ? Diameter.fromJson(json['diameter']) : null;
    mass = json['mass'] != null ? Mass.fromJson(json['mass']) : null;
    firstStage = json['first_stage'] != null ? FirstStage.fromJson(json['first_stage']) : null;
    secondStage = json['second_stage'] != null ? SecondStage.fromJson(json['second_stage']) : null;
    engines = json['engines'] != null ? Engines.fromJson(json['engines']) : null;
    landingLegs = json['landing_legs'] != null ? LandingLegs.fromJson(json['landing_legs']) : null;
    if (json['payload_weights'] != null) {
      payloadWeights = [];
      json['payload_weights'].forEach((v) {
        payloadWeights?.add(PayloadWeights.fromJson(v));
      });
    }
    flickrImages = json['flickr_images'] != null ? json['flickr_images'].cast<String>() : [];
    name = json['name'];
    type = json['type'];
    active = json['active'];
    stages = json['stages'];
    boosters = json['boosters'];
    costPerLaunch = json['cost_per_launch'];
    successRatePct = json['success_rate_pct'];
    firstFlight = json['first_flight'];
    country = json['country'];
    company = json['company'];
    wikipedia = json['wikipedia'];
    description = json['description'];
    id = json['id'];
  }
  Height? height;
  Diameter? diameter;
  Mass? mass;
  FirstStage? firstStage;
  SecondStage? secondStage;
  Engines? engines;
  LandingLegs? landingLegs;
  List<PayloadWeights>? payloadWeights;
  List<String>? flickrImages;
  String? name;
  String? type;
  bool? active;
  int? stages;
  int? boosters;
  int? costPerLaunch;
  int? successRatePct;
  String? firstFlight;
  String? country;
  String? company;
  String? wikipedia;
  String? description;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (height != null) {
      map['height'] = height?.toJson();
    }
    if (diameter != null) {
      map['diameter'] = diameter?.toJson();
    }
    if (mass != null) {
      map['mass'] = mass?.toJson();
    }
    if (firstStage != null) {
      map['first_stage'] = firstStage?.toJson();
    }
    if (secondStage != null) {
      map['second_stage'] = secondStage?.toJson();
    }
    if (engines != null) {
      map['engines'] = engines?.toJson();
    }
    if (landingLegs != null) {
      map['landing_legs'] = landingLegs?.toJson();
    }
    if (payloadWeights != null) {
      map['payload_weights'] = payloadWeights?.map((v) => v.toJson()).toList();
    }
    map['flickr_images'] = flickrImages;
    map['name'] = name;
    map['type'] = type;
    map['active'] = active;
    map['stages'] = stages;
    map['boosters'] = boosters;
    map['cost_per_launch'] = costPerLaunch;
    map['success_rate_pct'] = successRatePct;
    map['first_flight'] = firstFlight;
    map['country'] = country;
    map['company'] = company;
    map['wikipedia'] = wikipedia;
    map['description'] = description;
    map['id'] = id;
    return map;
  }
}

/// id : "leo"
/// name : "Low Earth Orbit"
/// kg : 450
/// lb : 992

class PayloadWeights {
  PayloadWeights({
    this.id,
    this.name,
    this.kg,
    this.lb,
  });

  PayloadWeights.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    kg = json['kg'];
    lb = json['lb'];
  }
  String? id;
  String? name;
  int? kg;
  int? lb;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['kg'] = kg;
    map['lb'] = lb;
    return map;
  }
}

/// number : 0
/// material : null

class LandingLegs {
  LandingLegs({
    this.number,
    this.material,
  });

  LandingLegs.fromJson(dynamic json) {
    number = json['number'];
    material = json['material'];
  }
  int? number;
  dynamic material;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = number;
    map['material'] = material;
    return map;
  }
}

/// isp : {"sea_level":267,"vacuum":304}
/// thrust_sea_level : {"kN":420,"lbf":94000}
/// thrust_vacuum : {"kN":480,"lbf":110000}
/// number : 1
/// type : "merlin"
/// version : "1C"
/// layout : "single"
/// engine_loss_max : 0
/// propellant_1 : "liquid oxygen"
/// propellant_2 : "RP-1 kerosene"
/// thrust_to_weight : 96

class Engines {
  Engines({
    this.isp,
    this.thrustSeaLevel,
    this.thrustVacuum,
    this.number,
    this.type,
    this.version,
    this.layout,
    this.engineLossMax,
    this.propellant1,
    this.propellant2,
    this.thrustToWeight,
  });

  Engines.fromJson(dynamic json) {
    isp = json['isp'] != null ? Isp.fromJson(json['isp']) : null;
    thrustSeaLevel = json['thrust_sea_level'] != null ? ThrustSeaLevel.fromJson(json['thrust_sea_level']) : null;
    thrustVacuum = json['thrust_vacuum'] != null ? ThrustVacuum.fromJson(json['thrust_vacuum']) : null;
    number = json['number'];
    type = json['type'];
    version = json['version'];
    layout = json['layout'];
    engineLossMax = json['engine_loss_max'];
    propellant1 = json['propellant_1'];
    propellant2 = json['propellant_2'];
    thrustToWeight = json['thrust_to_weight'];
  }
  Isp? isp;
  ThrustSeaLevel? thrustSeaLevel;
  ThrustVacuum? thrustVacuum;
  int? number;
  String? type;
  String? version;
  String? layout;
  int? engineLossMax;
  String? propellant1;
  String? propellant2;
  int? thrustToWeight;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (isp != null) {
      map['isp'] = isp?.toJson();
    }
    if (thrustSeaLevel != null) {
      map['thrust_sea_level'] = thrustSeaLevel?.toJson();
    }
    if (thrustVacuum != null) {
      map['thrust_vacuum'] = thrustVacuum?.toJson();
    }
    map['number'] = number;
    map['type'] = type;
    map['version'] = version;
    map['layout'] = layout;
    map['engine_loss_max'] = engineLossMax;
    map['propellant_1'] = propellant1;
    map['propellant_2'] = propellant2;
    map['thrust_to_weight'] = thrustToWeight;
    return map;
  }
}

/// kN : 480
/// lbf : 110000

class ThrustVacuum {
  ThrustVacuum({
    this.kN,
    this.lbf,
  });

  ThrustVacuum.fromJson(dynamic json) {
    kN = json['kN'];
    lbf = json['lbf'];
  }
  int? kN;
  int? lbf;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kN'] = kN;
    map['lbf'] = lbf;
    return map;
  }
}

/// kN : 420
/// lbf : 94000

class ThrustSeaLevel {
  ThrustSeaLevel({
    this.kN,
    this.lbf,
  });

  ThrustSeaLevel.fromJson(dynamic json) {
    kN = json['kN'];
    lbf = json['lbf'];
  }
  int? kN;
  int? lbf;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kN'] = kN;
    map['lbf'] = lbf;
    return map;
  }
}

/// sea_level : 267
/// vacuum : 304

class Isp {
  Isp({
    this.seaLevel,
    this.vacuum,
  });

  Isp.fromJson(dynamic json) {
    seaLevel = json['sea_level'];
    vacuum = json['vacuum'];
  }
  int? seaLevel;
  int? vacuum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sea_level'] = seaLevel;
    map['vacuum'] = vacuum;
    return map;
  }
}

/// thrust : {"kN":31,"lbf":7000}
/// payloads : {"composite_fairing":{"height":{"meters":3.5,"feet":11.5},"diameter":{"meters":1.5,"feet":4.9}},"option_1":"composite fairing"}
/// reusable : false
/// engines : 1
/// fuel_amount_tons : 3.38
/// burn_time_sec : 378

class SecondStage {
  SecondStage({
    this.thrust,
    this.payloads,
    this.reusable,
    this.engines,
    this.fuelAmountTons,
    this.burnTimeSec,
  });

  SecondStage.fromJson(dynamic json) {
    thrust = json['thrust'] != null ? Thrust.fromJson(json['thrust']) : null;
    payloads = json['payloads'] != null ? Payloads.fromJson(json['payloads']) : null;
    reusable = json['reusable'];
    engines = json['engines'];
    fuelAmountTons = json['fuel_amount_tons'];
    burnTimeSec = json['burn_time_sec'];
  }
  Thrust? thrust;
  Payloads? payloads;
  bool? reusable;
  int? engines;
  double? fuelAmountTons;
  int? burnTimeSec;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (thrust != null) {
      map['thrust'] = thrust?.toJson();
    }
    if (payloads != null) {
      map['payloads'] = payloads?.toJson();
    }
    map['reusable'] = reusable;
    map['engines'] = engines;
    map['fuel_amount_tons'] = fuelAmountTons;
    map['burn_time_sec'] = burnTimeSec;
    return map;
  }
}

/// composite_fairing : {"height":{"meters":3.5,"feet":11.5},"diameter":{"meters":1.5,"feet":4.9}}
/// option_1 : "composite fairing"

class Payloads {
  Payloads({
    this.compositeFairing,
    this.option1,
  });

  Payloads.fromJson(dynamic json) {
    compositeFairing = json['composite_fairing'] != null ? CompositeFairing.fromJson(json['composite_fairing']) : null;
    option1 = json['option_1'];
  }
  CompositeFairing? compositeFairing;
  String? option1;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (compositeFairing != null) {
      map['composite_fairing'] = compositeFairing?.toJson();
    }
    map['option_1'] = option1;
    return map;
  }
}

/// height : {"meters":3.5,"feet":11.5}
/// diameter : {"meters":1.5,"feet":4.9}

class CompositeFairing {
  CompositeFairing({
    this.height,
    this.diameter,
  });

  CompositeFairing.fromJson(dynamic json) {
    height = json['height'] != null ? Height.fromJson(json['height']) : null;
    diameter = json['diameter'] != null ? Diameter.fromJson(json['diameter']) : null;
  }
  Height? height;
  Diameter? diameter;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (height != null) {
      map['height'] = height?.toJson();
    }
    if (diameter != null) {
      map['diameter'] = diameter?.toJson();
    }
    return map;
  }
}

/// meters : 1.5
/// feet : 4.9

class Diameter {
  Diameter({
    this.meters,
    this.feet,
  });

  Diameter.fromJson(dynamic json) {
    meters = json['meters'];
    feet = json['feet'];
  }
  double? meters;
  double? feet;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['meters'] = meters;
    map['feet'] = feet;
    return map;
  }
}

/// meters : 3.5
/// feet : 11.5

class Height {
  Height({
    this.meters,
    this.feet,
  });

  Height.fromJson(dynamic json) {
    meters = json['meters'];
    feet = json['feet'];
  }
  double? meters;
  double? feet;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['meters'] = meters;
    map['feet'] = feet;
    return map;
  }
}

/// kN : 31
/// lbf : 7000

class Thrust {
  Thrust({
    this.kN,
    this.lbf,
  });

  Thrust.fromJson(dynamic json) {
    kN = json['kN'];
    lbf = json['lbf'];
  }
  int? kN;
  int? lbf;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kN'] = kN;
    map['lbf'] = lbf;
    return map;
  }
}

/// thrust_sea_level : {"kN":420,"lbf":94000}
/// thrust_vacuum : {"kN":480,"lbf":110000}
/// reusable : false
/// engines : 1
/// fuel_amount_tons : 44.3
/// burn_time_sec : 169

class FirstStage {
  FirstStage({
    this.thrustSeaLevel,
    this.thrustVacuum,
    this.reusable,
    this.engines,
    this.fuelAmountTons,
    this.burnTimeSec,
  });

  FirstStage.fromJson(dynamic json) {
    thrustSeaLevel = json['thrust_sea_level'] != null ? ThrustSeaLevel.fromJson(json['thrust_sea_level']) : null;
    thrustVacuum = json['thrust_vacuum'] != null ? ThrustVacuum.fromJson(json['thrust_vacuum']) : null;
    reusable = json['reusable'];
    engines = json['engines'];
    fuelAmountTons = json['fuel_amount_tons'];
    burnTimeSec = json['burn_time_sec'];
  }
  ThrustSeaLevel? thrustSeaLevel;
  ThrustVacuum? thrustVacuum;
  bool? reusable;
  int? engines;
  double? fuelAmountTons;
  int? burnTimeSec;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (thrustSeaLevel != null) {
      map['thrust_sea_level'] = thrustSeaLevel?.toJson();
    }
    if (thrustVacuum != null) {
      map['thrust_vacuum'] = thrustVacuum?.toJson();
    }
    map['reusable'] = reusable;
    map['engines'] = engines;
    map['fuel_amount_tons'] = fuelAmountTons;
    map['burn_time_sec'] = burnTimeSec;
    return map;
  }
}

/// kg : 30146
/// lb : 66460

class Mass {
  Mass({
    this.kg,
    this.lb,
  });

  Mass.fromJson(dynamic json) {
    kg = json['kg'];
    lb = json['lb'];
  }
  int? kg;
  int? lb;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kg'] = kg;
    map['lb'] = lb;
    return map;
  }
}
