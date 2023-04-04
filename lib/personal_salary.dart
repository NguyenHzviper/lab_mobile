const dependentCost = 11000000;

class PersonSalary {
  String name;
  double grossSalary;

  PersonSalary(this.name, this.grossSalary);

  double get Salary {
    final gross = grossSalary;
    double temp = gross * (1 - 0.105);
    if (temp <= dependentCost) return temp;
    return dependentCost + (temp - dependentCost) * (1 - 0.05);
  }
}
