class researchObjects {
  boolean isResearching;
  int researchTime, totalResearchTime;
  String flavourText;
  int[] researchTimeList = new int[5];
  String[] researchNameList = new String[5];
  int progress;
  int researchType;
  float[] bonusList = new float[5];
  float bonus;

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

      bonusList[0] = 0.00;
      bonusList[1] = 0.10;
      bonusList[2] = 0.15;
      bonusList[3] = 0.20;
      bonusList[4] = 0.25;
    } else if (researchType == 1) {
      researchTimeList[0] = 20;
      researchTimeList[1] = 50;
      researchTimeList[2] = 100;
      researchTimeList[3] = 200;

      researchNameList[0] = "Standardized Construction";
      researchNameList[1] = "Automated Construction";
      researchNameList[2] = "Off World Construction";
      researchNameList[3] = "Nanite Construction";

      bonusList[0] = 0;
      bonusList[1] = 0.05;
      bonusList[2] = 0.10;
      bonusList[3] = 0.20;
      bonusList[4] = 0.30;
    } else if (researchType == 2) {
      researchTimeList[0] = 100;
      researchTimeList[1] = 100;
      researchTimeList[2] = 150;
      researchTimeList[3] = 200;

      researchNameList[0] = "Durasteel Construction";
      researchNameList[1] = "Plasteel Construction";
      researchNameList[2] = "Superalloy Construction";
      researchNameList[3] = "Nanofibre Construction";

      bonusList[0] = 0;
      bonusList[1] = 0.05;
      bonusList[2] = 0.10;
      bonusList[3] = 0.20;
      bonusList[4] = 0.30;
    } else if (researchType == 3) {
      researchTimeList[0] = 20;
      researchTimeList[1] = 30;
      researchTimeList[2] = 50;
      researchTimeList[3] = 100;

      researchNameList[0] = "Surface Mining";
      researchNameList[1] = "Underground Mining";
      researchNameList[2] = "Open Pit Mining";
      researchNameList[3] = "Planetary Core Mining";

      bonusList[0] = 1.00;
      bonusList[1] = 1.10;
      bonusList[2] = 1.20;
      bonusList[3] = 1.30;
      bonusList[4] = 1.50;
    } else if (researchType == 4) {
      researchTimeList[0] = 10;
      researchTimeList[1] = 50;
      researchTimeList[2] = 75;
      researchTimeList[3] = 200;

      researchNameList[0] = "Fossil Fuel Power";
      researchNameList[1] = "Sustainable Power";
      researchNameList[2] = "Geothermal Power";
      researchNameList[3] = "Nuclear Power";

      bonusList[0] = 1.00;
      bonusList[1] = 1.10;
      bonusList[2] = 1.20;
      bonusList[3] = 1.30;
      bonusList[4] = 1.50;
    } else if (researchType == 5) {
      researchTimeList[0] = 20;
      researchTimeList[1] = 20;
      researchTimeList[2] = 50;
      researchTimeList[3] = 200;

      researchNameList[0] = "Breeding Program";
      researchNameList[1] = "Parental Planning";
      researchNameList[2] = "Hormone Therapy";
      researchNameList[3] = "Genome Diversification";

      bonusList[0] = 0;
      bonusList[1] = -5;
      bonusList[2] = -10;
      bonusList[3] = -20;
      bonusList[4] = -50;
    } else if (researchType == 6) {
      researchTimeList[0] = 50;
      researchTimeList[1] = 100;
      researchTimeList[2] = 200;
      researchTimeList[3] = 300;

      researchNameList[0] = "Frontier Research";
      researchNameList[1] = "Administrative AI";
      researchNameList[2] = "Cybernetic Researchers";
      researchNameList[3] = "Automated Research";

      bonusList[0] = 1.00;
      bonusList[1] = 1.10;
      bonusList[2] = 1.20;
      bonusList[3] = 1.30;
      bonusList[4] = 1.50;
    }
    researchTimeList[4] = 9999999;
    researchNameList[4] = "Finished";
    totalResearchTime = researchTimeList[progress];
    flavourText = researchNameList[progress];
    bonus = bonusList[progress];
  }

  void setResearchMenuVariables() {
    totalResearchTime = researchTimeList[progress];
    flavourText = researchNameList[progress];
    bonus = bonusList[progress];
  }

  int getBonus() {
    if (progress != 4) {
      if (researchType == 0) {
      } else if (researchType == 1) {
      } else if (researchType == 2) {
      } else if (researchType == 3) {
      } else if (researchType == 4) {
      } else if (researchType == 5) {
      } else if (researchType == 6) {
      }
    } else {
      if (researchType == 0) {
        return 25;
      } else if (researchType == 1) {
      } else if (researchType == 2) {
      } else if (researchType == 3) {
      } else if (researchType == 4) {
      } else if (researchType == 5) {
      } else if (researchType == 6) {
      }
    }
  }

  void research() {
    if (reseMan.selection == this.researchType) {
      if (this.progress != 4) {
        researchTime += research;
      }
    }
    if (researchTime >= totalResearchTime) {
      progress++;
      researchTime = 0;
    }
  }
}