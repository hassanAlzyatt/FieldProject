import 'dart:math';

List<double> cartesianVectorToCircular(double Ax, double Ay, double Az, List<double> point) {
  double angle = ((180 / pi) * atan((point[1]).abs() / (point[0]).abs()));
  double phaiy;

  if (point[0] < 0 && point[1] >= 0) {
    phaiy = 180 - angle;
  } else if (point[0] < 0 && point[1] < 0) {
    phaiy = 180 + angle;
  } else if (point[0] >= 0 && point[1] < 0) {
    phaiy = -1 * angle;
  } else {
    phaiy = angle;
  }

  List<double> circularVector = List.filled(3, 0);
  circularVector[0] = Ax * cos(pi / 180 * phaiy) + Ay * sin(pi / 180 * phaiy);
  circularVector[1] = -1 * Ax * sin((pi / 180) * phaiy) + Ay * cos((pi / 180) * phaiy);
  circularVector[2] = Az;
  return circularVector;
}

List<double> circularVectorToCartesian(double A_raw, double A_phai, double Az, List<double> point) {
  double angle = ((180 / pi) * atan((point[1]).abs() / (point[0]).abs()));
  double phaiy;

  if (point[0] < 0 && point[1] >= 0) {
    phaiy = 180 - angle;
  } else if (point[0] < 0 && point[1] < 0) {
    phaiy = 180 + angle;
  } else if (point[0] >= 0 && point[1] < 0) {
    phaiy = -1 * angle;
  } else {
    phaiy = angle;
  }

  List<double> cartesianVector = List.filled(3, 0);
  cartesianVector[0] = A_raw * cos(pi / 180 * phaiy) - A_phai * sin(pi / 180 * phaiy);
  cartesianVector[1] = A_raw * sin((pi / 180) * phaiy) + A_phai * cos((pi / 180) * phaiy);
  cartesianVector[2] = Az;
  return cartesianVector;
}

List<double> cartesianVectorToSpherical(double Ax, double Ay, double Az, List<double> point) {
  double angle = ((180 / pi) * atan((point[1]).abs() / (point[0]).abs()));
  double phaiy;

  if (point[0] < 0 && point[1] >= 0) {
    phaiy = 180 - angle;
  } else if (point[0] < 0 && point[1] < 0) {
    phaiy = 180 + angle;
  } else if (point[0] >= 0 && point[1] < 0) {
    phaiy = -1 * angle;
  } else {
    phaiy = angle;
  }

  double r = sqrt(point[0] * point[0] + point[1] * point[1] + point[2] * point[2]);
  double seta = (180 / pi) * acos(point[2] / r);

  List<double> sphericalVector = List.filled(3, 0);
  sphericalVector[0] = Ax * sin(pi / 180 * seta) * cos(pi / 180 * phaiy) + Ay * sin(pi / 180 * seta) * sin(pi / 180 * phaiy) + Az * cos(pi / 180 * seta);
  sphericalVector[1] = Ax * cos(pi / 180 * seta) * cos(pi / 180 * phaiy) + Ay * cos(pi / 180 * seta) * sin(pi / 180 * phaiy) - Az * sin(pi / 180 * seta);
  sphericalVector[2] = -1 * Ax * sin(pi / 180 * phaiy) + Ay * cos(pi / 180 * phaiy);
  return sphericalVector;
}

List<double> sphericalVectorToCartesian(double Ar, double A_seta, double A_phai, List<double> point) {
  double angle = ((180 / pi) * atan((point[1]).abs() / (point[0]).abs()));
  double phaiy;

  if (point[0] < 0 && point[1] >= 0) {
    phaiy = 180 - angle;
  } else if (point[0] < 0 && point[1] < 0) {
    phaiy = 180 + angle;
  } else if (point[0] >= 0 && point[1] < 0) {
    phaiy = -1 * angle;
  } else {
    phaiy = angle;
  }

  double r = sqrt(point[0] * point[0] + point[1] * point[1] + point[2] * point[2]);
  double seta = (180 / pi) * acos(point[2] / r);

  List<double> cartesianVector = List.filled(3, 0);
  cartesianVector[0] = Ar * sin(pi / 180 * seta) * cos(pi / 180 * phaiy) + A_seta * cos(pi / 180 * seta) * cos(pi / 180 * phaiy) - A_phai * sin(pi / 180 * phaiy);
  cartesianVector[1] = Ar * sin(pi / 180 * seta) * sin(pi / 180 * phaiy) + A_seta * cos(pi / 180 * seta) * sin(pi / 180 * phaiy) + A_phai * cos(pi / 180 * phaiy);
  cartesianVector[2] = Ar * cos(pi / 180 * seta) - A_seta * sin(pi / 180 * seta);
  return cartesianVector;
}

List<double> sphericalVectorToCircular(double Ar, double A_seta, double A_phai, List<double> point) {
  List<double> cartesianVector = sphericalVectorToCartesian(Ar, A_seta, A_phai, point);
  List<double> circularVector = cartesianVectorToCircular(cartesianVector[0], cartesianVector[1], cartesianVector[2], point);
  return circularVector;
}

List<double> circularVectorToSpherical(double A_raw, double A_phai, double Az, List<double> point) {
  List<double> cartesianVector = circularVectorToCartesian(A_raw, A_phai, Az, point);
  List<double> sphericalVector = cartesianVectorToSpherical(cartesianVector[0], cartesianVector[1], cartesianVector[2], point);
  return sphericalVector;
}

void main() {
  
  
  List<double> R = [];
  List<double> point = [-3,2,4];

  R = circularVectorToSpherical(-8.320502943378438,-5.547001962252293,0, point);
     print(R);
  //-5.570860145311556,-6.180314431495257,-5.547001962252292,
}
