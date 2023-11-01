class OperatorData {
  final int id;
  final String aufnr;
  final String posnr;
  final String auart;
  final String autyp;
  final String erdat;
  final String werks;
  final String lgort;
  final String matnr;
  final String vornr;
  final String ltxa1;
  final String yiel;
  final String rwqty;
  final String rjqty;
  final String act01;
  final String act02;
  final String act03;
  final String act04;
  final String act05;
  final String act06;
  final String dtc01;
  final String dwt01;
  final String dtc02;
  final String dwt02;
  final String dtc03;
  final String dwt03;
  final String dtc04;
  final String dwt04;
  final String dtc05;
  final String dwt05;
  final String dtc06;
  final String dwt06;
  final String cflag;

  OperatorData(
      {required this.id,
      required this.aufnr,
      required this.posnr,
      required this.auart,
      required this.autyp,
      required this.erdat,
      required this.werks,
      required this.lgort,
      required this.matnr,
      required this.vornr,
      required this.ltxa1,
      required this.yiel,
      required this.rwqty,
      required this.rjqty,
      required this.act01,
      required this.act02,
      required this.act03,
      required this.act04,
      required this.act05,
      required this.act06,
      required this.dtc01,
      required this.dwt01,
      required this.dtc02,
      required this.dwt02,
      required this.dtc03,
      required this.dwt03,
      required this.dtc04,
      required this.dwt04,
      required this.dtc05,
      required this.dwt05,
      required this.dtc06,
      required this.dwt06,
      required this.cflag});

  OperatorData.fromjson(
    Map<String, dynamic> json,
  )   : id = json["id"] as int,
        aufnr = json['aufnr'] as String,
        posnr = json['posnr'] as String,
        auart = json['auart'] as String,
        autyp = json['autyp'] as String,
        erdat = json['erdat'] as String,
        werks = json['werks'] as String,
        lgort = json['lgort'] as String,
        matnr = json['matnr'] as String,
        vornr = json['vornr'] as String,
        ltxa1 = json['ltxa1'] as String,
        yiel = json['yiel'] as String,
        rwqty = json['rwqty'] as String,
        rjqty = json['rjqty'] as String,
        act01 = json['act01'] as String,
        act02 = json['act02'] as String,
        act03 = json['act03'] as String,
        act04 = json['act04'] as String,
        act05 = json['act05'] as String,
        act06 = json['act06'] as String,
        dtc01 = json['dtc01'] as String,
        dwt01 = json['dwt01'] as String,
        dtc02 = json['dtc02'] as String,
        dwt02 = json['dwt02'] as String,
        dtc03 = json['dtc03'] as String,
        dwt03 = json['dwt03'] as String,
        dtc04 = json['dtc04'] as String,
        dwt04 = json['dwt04'] as String,
        dtc05 = json['dtc05'] as String,
        dwt05 = json['dwt05'] as String,
        dtc06 = json['dtc06'] as String,
        dwt06 = json['dwt06'] as String,
        cflag = json['cflag'] as String;
  //dtc05 = json['dtc05'] as String,
  Map<String, dynamic> toJson() => {
        'id': id,
        'aufnr': aufnr,
        'posnr': posnr,
        'auart': auart,
        'autyp': autyp,
        'erdat': erdat,
        'werks': werks,
        'lgort': lgort,
        'matnr': matnr,
        'vornr': vornr,
        'ltxa1': ltxa1,
        'yiel': yiel,
        'rwqty': rwqty,
        'rjqty': rjqty,
        'act01': act01,
        'act02': act02,
        'act03': act03,
        'act04': act04,
        'act05': act05,
        'act06': act06,
        'dtc01': dtc01,
        'dwt01': dwt01,
        'dtc02': dtc02,
        'dwt02': dwt02,
        'dtc03': dtc03,
        'dwt03': dwt03,
        'dtc04': dtc04,
        'dwt04': dwt04,
        'dtc05': dtc05,
        'dwt05': dwt05,
        'dtc06': dtc06,
        "dwt06": dwt06,
        "cflag": cflag
      };
}
