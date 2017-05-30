class researchObjects {
  boolean isResearching;
  int researchTime, totalResearchTime;
  String flavourText;
  int[] researchTimeList = new int[4];
  String[] researchNameList = new String[4];
  int progress;
  int researchType;

  researchObjects(int _researchType) {
    isResearching = false;
    researchTime = 0;
    totalResearchTime = 0;
    progress = 0;
    researchType = _researchType;
    if (researchType == 0) {
      researchTimeList[0] = 50;
      researchTimeList[1] = 100;
      researchTimeList[2] = 150;
      researchTimeList[3] = 200;

      researchNameList[0] = "Hydroponics";
      researchNameList[1] = "Cryohydroponics";
      researchNameList[2] = "Pyrohydroponics";
      researchNameList[3] = "Atmoshydroponics";
    } else if (researchType == 1) {
      researchTimeList[0] = 20;
      researchTimeList[1] = 50;
      researchTimeList[2] = 100;
      researchTimeList[3] = 200;

      researchNameList[0] = "Standardized Construction";
      researchNameList[1] = "Automated Construction";
      researchNameList[2] = "Off World Construction";
      researchNameList[3] = "Nanite Construction";
    } else if (researchType == 2) {
      researchTimeList[0] = 100;
      researchTimeList[1] = 100;
      researchTimeList[2] = 150;
      researchTimeList[3] = 200;

      researchNameList[0] = "Durasteel Construction";
      researchNameList[1] = "Plasteel Construction";
      researchNameList[2] = "Superalloy Construction";
      researchNameList[3] = "Nanofibre Construction";
    } else if (researchType == 3) {
      researchTimeList[0] = 20;
      researchTimeList[1] = 30;
      researchTimeList[2] = 50;
      researchTimeList[3] = 100;

      researchNameList[0] = "Surface Mining";
      researchNameList[1] = "Underground Mining";
      researchNameList[2] = "Open Pit Mining";
      researchNameList[3] = "Planetary Core Mining";
    } else if (researchType == 4) {
      researchTimeList[0] = 10;
      researchTimeList[1] = 50;
      researchTimeList[2] = 75;
      researchTimeList[3] = 200;

      researchNameList[0] = "Fossil Fuel Power";
      researchNameList[1] = "Sustainable Power";
      researchNameList[2] = "Geothermal Power";
      researchNameList[3] = "Nuclear Power";
    } else if (researchType == 5) {
      researchTimeList[0] = 20;
      researchTimeList[1] = 20;
      researchTimeList[2] = 50;
      researchTimeList[3] = 200;

      researchNameList[0] = "Breeding Program";
      researchNameList[1] = "Parental Planning";
      researchNameList[2] = "Hormone Therapy";
      researchNameList[3] = "Genome Diversification";
    } else if (researchType == 6) {
      researchTimeList[0] = 50;
      researchTimeList[1] = 100;
      researchTimeList[2] = 200;
      researchTimeList[3] = 300;

      researchNameList[0] = "Frontier Research";
      researchNameList[1] = "Administrative AI";
      researchNameList[2] = "Cybernetic Researchers";
      researchNameList[3] = "Automated Research";
    }
    totalResearchTime = researchTimeList[0];
    flavourText = researchNameList[0];
  }

  void research() {
    if (resMan.selection == this.researchType) {
      researchTime += research;
    }
  }
}