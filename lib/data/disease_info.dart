class DiseaseInfo {
  final String cause;
  final List<String> symptoms;
  final List<String> organic;
  final List<String> chemical;
  final List<String> prevention;

  final String urduCause;
  final List<String> urduSymptoms;
  final List<String> urduOrganic;
  final List<String> urduChemical;
  final List<String> urduPrevention;

  DiseaseInfo({
    required this.cause,
    required this.symptoms,
    required this.organic,
    required this.chemical,
    required this.prevention,
    required this.urduCause,
    required this.urduSymptoms,
    required this.urduOrganic,
    required this.urduChemical,
    required this.urduPrevention,
  });
}

final Map<String, DiseaseInfo> diseaseDatabase = {

  // =========================
  // APPLE
  // =========================

  "Apple Apple scab": DiseaseInfo(
    cause: "Fungal disease caused by Venturia inaequalis.",
    symptoms: [
      "Olive green spots on leaves",
      "Dark spots on fruits",
      "Premature leaf fall",
    ],
    organic: [
      "Apply neem oil spray",
      "Remove infected leaves",
      "Use compost fertilizer",
    ],
    chemical: [
      "Apply Mancozeb fungicide",
      "Use Copper based fungicide",
    ],
    prevention: [
      "Maintain orchard hygiene",
      "Avoid overhead watering",
      "Keep proper plant spacing",
    ],
    urduCause: "یہ Venturia inaequalis نامی فنگس کی وجہ سے ہونے والی بیماری ہے۔",
    urduSymptoms: [
      "پتوں پر زیتونی سبز دھبے",
      "پھلوں پر گہرے دھبے",
      "وقت سے پہلے پتے جھڑنا",
    ],
    urduOrganic: [
      "نیم کے تیل کا اسپرے کریں",
      "متاثرہ پتے ہٹا دیں",
      "کمپوسٹ کھاد استعمال کریں",
    ],
    urduChemical: [
      "Mancozeb فنگس کش دوا استعمال کریں",
      "تانبے پر مبنی فنگس کش دوا استعمال کریں",
    ],
    urduPrevention: [
      "باغ کی صفائی برقرار رکھیں",
      "اوپر سے پانی دینے سے گریز کریں",
      "پودوں کے درمیان مناسب فاصلہ رکھیں",
    ],
  ),

  "Apple Black rot": DiseaseInfo(
    cause: "Fungal disease caused by Botryosphaeria obtusa.",
    symptoms: [
      "Dark rotten spots on fruits",
      "Leaf spots",
      "Branch damage",
    ],
    organic: [
      "Remove infected fruits",
      "Prune affected branches",
      "Keep orchard clean",
    ],
    chemical: [
      "Apply recommended fungicide",
      "Use copper based spray",
    ],
    prevention: [
      "Remove fallen leaves",
      "Avoid fruit injuries",
      "Regular monitoring",
    ],
    urduCause: "یہ Botryosphaeria obtusa نامی فنگس کی وجہ سے ہونے والی بیماری ہے۔",
    urduSymptoms: [
      "پھلوں پر سیاہ اور سڑے ہوئے دھبے",
      "پتوں پر دھبے",
      "شاخوں کو نقصان",
    ],
    urduOrganic: [
      "متاثرہ پھل ہٹا دیں",
      "متاثرہ شاخوں کی کانٹ چھانٹ کریں",
      "باغ کو صاف رکھیں",
    ],
    urduChemical: [
      "تجویز کردہ فنگس کش دوا استعمال کریں",
      "تانبے پر مبنی اسپرے استعمال کریں",
    ],
    urduPrevention: [
      "گرے ہوئے پتے ہٹا دیں",
      "پھلوں کو زخمی ہونے سے بچائیں",
      "پودوں کی باقاعدگی سے نگرانی کریں",
    ],
  ),

  "Apple Cedar apple rust": DiseaseInfo(
    cause: "Fungal disease caused by Gymnosporangium fungus.",
    symptoms: [
      "Yellow-orange spots on leaves",
      "Leaf fall",
      "Reduced fruit quality",
    ],
    organic: [
      "Remove infected leaves",
      "Apply neem oil",
    ],
    chemical: [
      "Apply Mancozeb fungicide",
    ],
    prevention: [
      "Maintain orchard cleanliness",
      "Remove infected nearby plants",
    ],
    urduCause: "یہ Gymnosporangium فنگس کی وجہ سے ہونے والی بیماری ہے۔",
    urduSymptoms: [
      "پتوں پر پیلے اور نارنجی دھبے",
      "پتے جھڑنا",
      "پھلوں کے معیار میں کمی",
    ],
    urduOrganic: [
      "متاثرہ پتے ہٹا دیں",
      "نیم کا تیل استعمال کریں",
    ],
    urduChemical: [
      "Mancozeb فنگس کش دوا استعمال کریں",
    ],
    urduPrevention: [
      "باغ کی صفائی برقرار رکھیں",
      "قریب موجود متاثرہ پودے ہٹا دیں",
    ],
  ),

  "Apple healthy": DiseaseInfo(
    cause: "Healthy apple plant with no disease detected.",
    symptoms: [
      "Green leaves",
      "Normal growth",
      "Healthy fruits",
    ],
    organic: [
      "Apply compost regularly",
      "Maintain proper irrigation",
    ],
    chemical: [
      "No chemical treatment required",
    ],
    prevention: [
      "Monitor plant regularly",
      "Control weeds",
    ],
    urduCause: "یہ صحت مند سیب کا پودا ہے اور کسی بیماری کی نشاندہی نہیں ہوئی۔",
    urduSymptoms: [
      "سبز پتے",
      "معمول کی نشوونما",
      "صحت مند پھل",
    ],
    urduOrganic: [
      "باقاعدگی سے کمپوسٹ کھاد استعمال کریں",
      "مناسب آبپاشی برقرار رکھیں",
    ],
    urduChemical: [
      "کسی کیمیائی علاج کی ضرورت نہیں",
    ],
    urduPrevention: [
      "پودے کی باقاعدگی سے نگرانی کریں",
      "جڑی بوٹیوں کو کنٹرول کریں",
    ],
  ),

  // =========================
  // BLUEBERRY
  // =========================

  "Blueberry healthy": DiseaseInfo(
    cause: "Healthy blueberry plant.",
    symptoms: [
      "Fresh green leaves",
      "Normal growth",
      "Healthy stems",
    ],
    organic: [
      "Apply organic compost",
      "Maintain watering",
    ],
    chemical: [
      "No chemical treatment required",
    ],
    prevention: [
      "Monitor plant weekly",
      "Maintain soil moisture",
    ],
    urduCause: "یہ صحت مند بلیو بیری کا پودا ہے۔",
    urduSymptoms: [
      "تازہ سبز پتے",
      "معمول کی نشوونما",
      "صحت مند تنے",
    ],
    urduOrganic: [
      "نامیاتی کمپوسٹ استعمال کریں",
      "مناسب آبپاشی برقرار رکھیں",
    ],
    urduChemical: [
      "کسی کیمیائی علاج کی ضرورت نہیں",
    ],
    urduPrevention: [
      "ہر ہفتے پودے کی نگرانی کریں",
      "مٹی میں مناسب نمی برقرار رکھیں",
    ],
  ),

  // =========================
  // CHERRY
  // =========================

  "Cherry (including sour) Powdery mildew": DiseaseInfo(
    cause: "Fungal disease caused by powdery mildew fungus.",
    symptoms: [
      "White powder on leaves",
      "Leaf curling",
      "Weak plant growth",
    ],
    organic: [
      "Apply neem oil",
      "Remove infected leaves",
      "Improve air circulation",
    ],
    chemical: [
      "Apply sulfur fungicide",
    ],
    prevention: [
      "Avoid high humidity",
      "Maintain plant spacing",
    ],
    urduCause: "یہ پاؤڈری ملڈیو فنگس کی وجہ سے ہونے والی بیماری ہے۔",
    urduSymptoms: [
      "پتوں پر سفید پاؤڈر جیسی تہہ",
      "پتوں کا مڑنا",
      "پودے کی کمزور نشوونما",
    ],
    urduOrganic: [
      "نیم کا تیل استعمال کریں",
      "متاثرہ پتے ہٹا دیں",
      "ہوا کی آمدورفت بہتر بنائیں",
    ],
    urduChemical: [
      "سلفر فنگس کش دوا استعمال کریں",
    ],
    urduPrevention: [
      "زیادہ نمی سے گریز کریں",
      "پودوں کے درمیان مناسب فاصلہ رکھیں",
    ],
  ),

  "Cherry (including sour) healthy": DiseaseInfo(
    cause: "Healthy cherry plant.",
    symptoms: [
      "Green leaves",
      "Normal growth",
    ],
    organic: [
      "Apply compost",
      "Maintain irrigation",
    ],
    chemical: [
      "No chemical treatment required",
    ],
    prevention: [
      "Regular inspection",
      "Keep field clean",
    ],
    urduCause: "یہ صحت مند چیری کا پودا ہے۔",
    urduSymptoms: [
      "سبز پتے",
      "معمول کی نشوونما",
    ],
    urduOrganic: [
      "کمپوسٹ استعمال کریں",
      "مناسب آبپاشی برقرار رکھیں",
    ],
    urduChemical: [
      "کسی کیمیائی علاج کی ضرورت نہیں",
    ],
    urduPrevention: [
      "باقاعدگی سے پودے کا معائنہ کریں",
      "کھیت کو صاف رکھیں",
    ],
  ),

  // =========================
  // CORN
  // =========================

  "Corn (maize) Cercospora leaf spot Gray leaf spot": DiseaseInfo(
    cause: "Fungal disease causing grey leaf spots.",
    symptoms: [
      "Grey rectangular spots on leaves",
      "Leaf drying",
      "Reduced yield",
    ],
    organic: [
      "Remove infected leaves",
      "Improve soil health",
    ],
    chemical: [
      "Apply suitable fungicide",
      "Use recommended crop spray",
    ],
    prevention: [
      "Practice crop rotation",
      "Use resistant varieties",
    ],
    urduCause: "یہ فنگس کی بیماری ہے جو پتوں پر سرمئی دھبے پیدا کرتی ہے۔",
    urduSymptoms: [
      "پتوں پر سرمئی مستطیل دھبے",
      "پتے خشک ہونا",
      "پیداوار میں کمی",
    ],
    urduOrganic: [
      "متاثرہ پتے ہٹا دیں",
      "مٹی کی صحت بہتر بنائیں",
    ],
    urduChemical: [
      "مناسب فنگس کش دوا استعمال کریں",
      "تجویز کردہ فصل کا اسپرے استعمال کریں",
    ],
    urduPrevention: [
      "فصلوں کی گردش کا طریقہ اپنائیں",
      "مزاحمت رکھنے والی اقسام استعمال کریں",
    ],
  ),

  "Corn (maize) Common rust": DiseaseInfo(
    cause: "Fungal disease caused by Puccinia species.",
    symptoms: [
      "Rust colored spots",
      "Leaf damage",
      "Reduced growth",
    ],
    organic: [
      "Remove infected leaves",
      "Maintain healthy soil",
    ],
    chemical: [
      "Apply fungicide when needed",
    ],
    prevention: [
      "Use resistant seeds",
      "Avoid excess moisture",
    ],
    urduCause: "یہ Puccinia کی اقسام کی وجہ سے ہونے والی فنگس کی بیماری ہے۔",
    urduSymptoms: [
      "زنگ جیسے رنگ کے دھبے",
      "پتوں کو نقصان",
      "نشوونما میں کمی",
    ],
    urduOrganic: [
      "متاثرہ پتے ہٹا دیں",
      "مٹی کی صحت برقرار رکھیں",
    ],
    urduChemical: [
      "ضرورت کے مطابق فنگس کش دوا استعمال کریں",
    ],
    urduPrevention: [
      "مزاحمت رکھنے والے بیج استعمال کریں",
      "زیادہ نمی سے گریز کریں",
    ],
  ),

  "Corn (maize) Northern Leaf Blight": DiseaseInfo(
    cause: "Fungal disease caused by Exserohilum turcicum.",
    symptoms: [
      "Long grey leaf lesions",
      "Leaf drying",
      "Low crop production",
    ],
    organic: [
      "Remove infected parts",
      "Improve field hygiene",
    ],
    chemical: [
      "Apply suitable fungicide",
    ],
    prevention: [
      "Crop rotation",
      "Use resistant varieties",
    ],
    urduCause: "یہ Exserohilum turcicum کی وجہ سے ہونے والی فنگس کی بیماری ہے۔",
    urduSymptoms: [
      "پتوں پر لمبے سرمئی زخم جیسے دھبے",
      "پتے خشک ہونا",
      "فصل کی پیداوار میں کمی",
    ],
    urduOrganic: [
      "متاثرہ حصے ہٹا دیں",
      "کھیت کی صفائی بہتر بنائیں",
    ],
    urduChemical: [
      "مناسب فنگس کش دوا استعمال کریں",
    ],
    urduPrevention: [
      "فصلوں کی گردش اپنائیں",
      "مزاحمت رکھنے والی اقسام استعمال کریں",
    ],
  ),

  "Corn (maize) healthy": DiseaseInfo(
    cause: "Healthy corn plant.",
    symptoms: [
      "Green leaves",
      "Normal growth",
    ],
    organic: [
      "Apply organic fertilizer",
      "Maintain irrigation",
    ],
    chemical: [
      "No chemical treatment required",
    ],
    prevention: [
      "Regular monitoring",
      "Control weeds",
    ],
    urduCause: "یہ صحت مند مکئی کا پودا ہے۔",
    urduSymptoms: [
      "سبز پتے",
      "معمول کی نشوونما",
    ],
    urduOrganic: [
      "نامیاتی کھاد استعمال کریں",
      "مناسب آبپاشی برقرار رکھیں",
    ],
    urduChemical: [
      "کسی کیمیائی علاج کی ضرورت نہیں",
    ],
    urduPrevention: [
      "باقاعدگی سے نگرانی کریں",
      "جڑی بوٹیوں کو کنٹرول کریں",
    ],
  ),

  // =========================
  // GRAPE
  // =========================

  "Grape Black rot": DiseaseInfo(
    cause: "Fungal disease caused by Guignardia bidwellii.",
    symptoms: [
      "Black spots on leaves",
      "Fruit rot",
      "Leaf damage",
    ],
    organic: [
      "Remove infected fruits",
      "Prune affected parts",
    ],
    chemical: [
      "Apply recommended fungicide",
    ],
    prevention: [
      "Maintain vineyard hygiene",
      "Avoid excess moisture",
    ],
    urduCause: "یہ Guignardia bidwellii کی وجہ سے ہونے والی فنگس کی بیماری ہے۔",
    urduSymptoms: [
      "پتوں پر سیاہ دھبے",
      "پھلوں کا سڑنا",
      "پتوں کو نقصان",
    ],
    urduOrganic: [
      "متاثرہ پھل ہٹا دیں",
      "متاثرہ حصوں کی کانٹ چھانٹ کریں",
    ],
    urduChemical: [
      "تجویز کردہ فنگس کش دوا استعمال کریں",
    ],
    urduPrevention: [
      "انگور کے باغ کی صفائی برقرار رکھیں",
      "زیادہ نمی سے گریز کریں",
    ],
  ),

  "Grape Esca (Black Measles)": DiseaseInfo(
    cause: "Fungal disease affecting grape vines.",
    symptoms: [
      "Leaf discoloration",
      "Fruit damage",
      "Weak vines",
    ],
    organic: [
      "Remove infected vines",
      "Prune affected areas",
    ],
    chemical: [
      "Use recommended fungicide",
    ],
    prevention: [
      "Maintain vineyard health",
      "Remove infected material",
    ],
    urduCause: "یہ انگور کی بیلوں کو متاثر کرنے والی فنگس کی بیماری ہے۔",
    urduSymptoms: [
      "پتوں کا رنگ تبدیل ہونا",
      "پھلوں کو نقصان",
      "بیلوں کا کمزور ہونا",
    ],
    urduOrganic: [
      "متاثرہ بیلیں ہٹا دیں",
      "متاثرہ حصوں کی کانٹ چھانٹ کریں",
    ],
    urduChemical: [
      "تجویز کردہ فنگس کش دوا استعمال کریں",
    ],
    urduPrevention: [
      "انگور کے باغ کی صحت برقرار رکھیں",
      "متاثرہ مواد ہٹا دیں",
    ],
  ),

  "Grape Leaf blight (Isariopsis Leaf Spot)": DiseaseInfo(
    cause: "Fungal leaf disease in grape plants.",
    symptoms: [
      "Brown leaf spots",
      "Leaf drying",
      "Reduced growth",
    ],
    organic: [
      "Remove infected leaves",
      "Improve airflow",
    ],
    chemical: [
      "Apply fungicide spray",
    ],
    prevention: [
      "Maintain vineyard cleanliness",
      "Avoid wet leaves",
    ],
    urduCause: "یہ انگور کے پودوں میں پتوں کی فنگس کی بیماری ہے۔",
    urduSymptoms: [
      "پتوں پر بھورے دھبے",
      "پتے خشک ہونا",
      "نشوونما میں کمی",
    ],
    urduOrganic: [
      "متاثرہ پتے ہٹا دیں",
      "ہوا کی آمدورفت بہتر بنائیں",
    ],
    urduChemical: [
      "فنگس کش دوا کا اسپرے کریں",
    ],
    urduPrevention: [
      "انگور کے باغ کو صاف رکھیں",
      "پتوں کو گیلا رکھنے سے گریز کریں",
    ],
  ),

  "Grape healthy": DiseaseInfo(
    cause: "Healthy grape plant.",
    symptoms: [
      "Fresh green leaves",
      "Normal growth",
    ],
    organic: [
      "Apply compost",
      "Maintain watering",
    ],
    chemical: [
      "No chemical treatment required",
    ],
    prevention: [
      "Regular monitoring",
      "Prune regularly",
    ],
    urduCause: "یہ صحت مند انگور کا پودا ہے۔",
    urduSymptoms: [
      "تازہ سبز پتے",
      "معمول کی نشوونما",
    ],
    urduOrganic: [
      "کمپوسٹ استعمال کریں",
      "مناسب آبپاشی برقرار رکھیں",
    ],
    urduChemical: [
      "کسی کیمیائی علاج کی ضرورت نہیں",
    ],
    urduPrevention: [
      "باقاعدگی سے نگرانی کریں",
      "باقاعدگی سے کانٹ چھانٹ کریں",
    ],
  ),

  // =========================
  // POTATO
  // =========================

  "Potato Early blight": DiseaseInfo(
    cause: "Fungal disease caused by Alternaria species.",
    symptoms: [
      "Brown circular spots",
      "Yellowing leaves",
      "Leaf fall",
    ],
    organic: [
      "Remove affected leaves",
      "Improve soil health",
    ],
    chemical: [
      "Apply Chlorothalonil",
      "Apply Mancozeb",
    ],
    prevention: [
      "Crop rotation",
      "Maintain field hygiene",
    ],
    urduCause: "یہ Alternaria کی اقسام کی وجہ سے ہونے والی فنگس کی بیماری ہے۔",
    urduSymptoms: [
      "پتوں پر بھورے گول دھبے",
      "پتوں کا پیلا ہونا",
      "پتے جھڑنا",
    ],
    urduOrganic: [
      "متاثرہ پتے ہٹا دیں",
      "مٹی کی صحت بہتر بنائیں",
    ],
    urduChemical: [
      "Chlorothalonil استعمال کریں",
      "Mancozeb استعمال کریں",
    ],
    urduPrevention: [
      "فصلوں کی گردش اپنائیں",
      "کھیت کی صفائی برقرار رکھیں",
    ],
  ),

  "Potato Late blight": DiseaseInfo(
    cause: "Disease caused by Phytophthora infestans.",
    symptoms: [
      "Brown leaf spots",
      "Leaf drying",
      "Dark lesions on stems",
    ],
    organic: [
      "Remove infected leaves",
      "Avoid overhead watering",
    ],
    chemical: [
      "Apply Mancozeb",
      "Use Metalaxyl fungicide",
    ],
    prevention: [
      "Use healthy seeds",
      "Avoid excess moisture",
      "Crop rotation",
    ],
    urduCause: "یہ Phytophthora infestans کی وجہ سے ہونے والی بیماری ہے۔",
    urduSymptoms: [
      "پتوں پر بھورے دھبے",
      "پتے خشک ہونا",
      "تنوں پر گہرے زخم جیسے دھبے",
    ],
    urduOrganic: [
      "متاثرہ پتے ہٹا دیں",
      "اوپر سے پانی دینے سے گریز کریں",
    ],
    urduChemical: [
      "Mancozeb استعمال کریں",
      "Metalaxyl فنگس کش دوا استعمال کریں",
    ],
    urduPrevention: [
      "صحت مند بیج استعمال کریں",
      "زیادہ نمی سے گریز کریں",
      "فصلوں کی گردش اپنائیں",
    ],
  ),

  "Potato healthy": DiseaseInfo(
    cause: "Healthy potato plant.",
    symptoms: [
      "Green leaves",
      "Normal plant growth",
    ],
    organic: [
      "Use compost fertilizer",
      "Maintain watering",
    ],
    chemical: [
      "No treatment required",
    ],
    prevention: [
      "Regular monitoring",
      "Use quality seeds",
    ],
    urduCause: "یہ صحت مند آلو کا پودا ہے۔",
    urduSymptoms: [
      "سبز پتے",
      "پودے کی معمول کی نشوونما",
    ],
    urduOrganic: [
      "کمپوسٹ کھاد استعمال کریں",
      "مناسب آبپاشی برقرار رکھیں",
    ],
    urduChemical: [
      "کسی علاج کی ضرورت نہیں",
    ],
    urduPrevention: [
      "باقاعدگی سے نگرانی کریں",
      "معیاری بیج استعمال کریں",
    ],
  ),

  // =========================
  // TOMATO
  // =========================

  "Tomato Early blight": DiseaseInfo(
    cause: "Fungal disease caused by Alternaria.",
    symptoms: [
      "Brown spots on leaves",
      "Yellowing leaves",
      "Fruit lesions",
    ],
    organic: [
      "Remove infected leaves",
      "Apply neem oil",
    ],
    chemical: [
      "Use Chlorothalonil",
      "Use Mancozeb",
    ],
    prevention: [
      "Crop rotation",
      "Avoid overhead irrigation",
    ],
    urduCause: "یہ Alternaria کی وجہ سے ہونے والی فنگس کی بیماری ہے۔",
    urduSymptoms: [
      "پتوں پر بھورے دھبے",
      "پتوں کا پیلا ہونا",
      "پھلوں پر زخم جیسے دھبے",
    ],
    urduOrganic: [
      "متاثرہ پتے ہٹا دیں",
      "نیم کا تیل استعمال کریں",
    ],
    urduChemical: [
      "Chlorothalonil استعمال کریں",
      "Mancozeb استعمال کریں",
    ],
    urduPrevention: [
      "فصلوں کی گردش اپنائیں",
      "اوپر سے آبپاشی سے گریز کریں",
    ],
  ),

  "Tomato Late blight": DiseaseInfo(
    cause: "Disease caused by Phytophthora infestans.",
    symptoms: [
      "Dark leaf spots",
      "Fruit damage",
      "Rapid plant decline",
    ],
    organic: [
      "Remove infected leaves",
      "Improve airflow",
    ],
    chemical: [
      "Use Copper fungicide",
      "Apply recommended fungicide",
    ],
    prevention: [
      "Avoid wet leaves",
      "Maintain spacing",
    ],
    urduCause: "یہ Phytophthora infestans کی وجہ سے ہونے والی بیماری ہے۔",
    urduSymptoms: [
      "پتوں پر گہرے دھبے",
      "پھلوں کو نقصان",
      "پودے کی تیزی سے کمزور ہونا",
    ],
    urduOrganic: [
      "متاثرہ پتے ہٹا دیں",
      "ہوا کی آمدورفت بہتر بنائیں",
    ],
    urduChemical: [
      "تانبے پر مبنی فنگس کش دوا استعمال کریں",
      "تجویز کردہ فنگس کش دوا استعمال کریں",
    ],
    urduPrevention: [
      "پتوں کو گیلا رکھنے سے گریز کریں",
      "پودوں کے درمیان مناسب فاصلہ رکھیں",
    ],
  ),

  "Tomato healthy": DiseaseInfo(
    cause: "Healthy tomato plant.",
    symptoms: [
      "Green leaves",
      "Normal growth",
      "Healthy fruits",
    ],
    organic: [
      "Apply compost",
      "Maintain watering",
    ],
    chemical: [
      "No chemical treatment required",
    ],
    prevention: [
      "Regular monitoring",
      "Control weeds",
    ],
    urduCause: "یہ صحت مند ٹماٹر کا پودا ہے۔",
    urduSymptoms: [
      "سبز پتے",
      "معمول کی نشوونما",
      "صحت مند پھل",
    ],
    urduOrganic: [
      "کمپوسٹ استعمال کریں",
      "مناسب آبپاشی برقرار رکھیں",
    ],
    urduChemical: [
      "کسی کیمیائی علاج کی ضرورت نہیں",
    ],
    urduPrevention: [
      "باقاعدگی سے نگرانی کریں",
      "جڑی بوٹیوں کو کنٹرول کریں",
    ],
  ),

  // =========================
  // PEPPER
  // =========================

  "Pepper bell Bacterial spot": DiseaseInfo(
    cause: "Bacterial disease affecting pepper plants.",
    symptoms: [
      "Dark spots on leaves",
      "Fruit spots",
      "Leaf damage",
    ],
    organic: [
      "Remove infected leaves",
      "Use neem oil",
    ],
    chemical: [
      "Apply copper based bactericide",
    ],
    prevention: [
      "Use disease free seeds",
      "Avoid wet leaves",
    ],
    urduCause: "یہ بیکٹیریا کی وجہ سے ہونے والی بیماری ہے جو مرچ کے پودوں کو متاثر کرتی ہے۔",
    urduSymptoms: [
      "پتوں پر گہرے دھبے",
      "پھلوں پر دھبے",
      "پتوں کو نقصان",
    ],
    urduOrganic: [
      "متاثرہ پتے ہٹا دیں",
      "نیم کا تیل استعمال کریں",
    ],
    urduChemical: [
      "تانبے پر مبنی بیکٹیریا کش دوا استعمال کریں",
    ],
    urduPrevention: [
      "بیماری سے پاک بیج استعمال کریں",
      "پتوں کو گیلا رکھنے سے گریز کریں",
    ],
  ),

  "Pepper bell healthy": DiseaseInfo(
    cause: "Healthy pepper plant.",
    symptoms: [
      "Green leaves",
      "Normal fruit growth",
    ],
    organic: [
      "Apply compost",
      "Maintain irrigation",
    ],
    chemical: [
      "No chemical treatment required",
    ],
    prevention: [
      "Regular monitoring",
      "Remove weeds",
    ],
    urduCause: "یہ صحت مند شملہ مرچ کا پودا ہے۔",
    urduSymptoms: [
      "سبز پتے",
      "پھلوں کی معمول کی نشوونما",
    ],
    urduOrganic: [
      "کمپوسٹ استعمال کریں",
      "مناسب آبپاشی برقرار رکھیں",
    ],
    urduChemical: [
      "کسی کیمیائی علاج کی ضرورت نہیں",
    ],
    urduPrevention: [
      "باقاعدگی سے نگرانی کریں",
      "جڑی بوٹیاں ہٹا دیں",
    ],
  ),

  // =========================
  // ORANGE
  // =========================

  "Orange Haunglongbing (Citrus greening)": DiseaseInfo(
    cause: "Bacterial disease affecting citrus plants.",
    symptoms: [
      "Yellowing leaves",
      "Small fruits",
      "Poor fruit quality",
    ],
    organic: [
      "Remove infected branches",
      "Maintain plant nutrition",
    ],
    chemical: [
      "Control insect vectors with recommended spray",
    ],
    prevention: [
      "Use disease free plants",
      "Monitor citrus trees regularly",
    ],
    urduCause: "یہ بیکٹیریا کی وجہ سے ہونے والی بیماری ہے جو سٹرَس کے پودوں کو متاثر کرتی ہے۔",
    urduSymptoms: [
      "پتوں کا پیلا ہونا",
      "چھوٹے پھل",
      "پھلوں کا خراب معیار",
    ],
    urduOrganic: [
      "متاثرہ شاخیں ہٹا دیں",
      "پودے کی غذائی ضروریات پوری کریں",
    ],
    urduChemical: [
      "تجویز کردہ اسپرے کے ذریعے کیڑے مکوڑوں کو کنٹرول کریں",
    ],
    urduPrevention: [
      "بیماری سے پاک پودے استعمال کریں",
      "سٹرَس کے درختوں کی باقاعدگی سے نگرانی کریں",
    ],
  ),

  "Orange healthy": DiseaseInfo(
    cause: "Healthy orange plant.",
    symptoms: [
      "Green leaves",
      "Normal growth",
      "Healthy fruits",
    ],
    organic: [
      "Apply compost",
      "Maintain watering",
    ],
    chemical: [
      "No chemical treatment required",
    ],
    prevention: [
      "Regular monitoring",
      "Maintain orchard hygiene",
    ],
    urduCause: "یہ صحت مند مالٹے کا پودا ہے۔",
    urduSymptoms: [
      "سبز پتے",
      "معمول کی نشوونما",
      "صحت مند پھل",
    ],
    urduOrganic: [
      "کمپوسٹ استعمال کریں",
      "مناسب آبپاشی برقرار رکھیں",
    ],
    urduChemical: [
      "کسی کیمیائی علاج کی ضرورت نہیں",
    ],
    urduPrevention: [
      "باقاعدگی سے نگرانی کریں",
      "باغ کی صفائی برقرار رکھیں",
    ],
  ),

  // =========================
  // PEACH
  // =========================

  "Peach Bacterial spot": DiseaseInfo(
    cause: "Bacterial disease affecting peach leaves and fruits.",
    symptoms: [
      "Dark leaf spots",
      "Fruit spots",
      "Leaf damage",
    ],
    organic: [
      "Remove infected leaves",
      "Improve plant health",
    ],
    chemical: [
      "Apply copper based spray",
    ],
    prevention: [
      "Use healthy plants",
      "Avoid excessive moisture",
    ],
    urduCause: "یہ بیکٹیریا کی بیماری ہے جو آڑو کے پتوں اور پھلوں کو متاثر کرتی ہے۔",
    urduSymptoms: [
      "پتوں پر گہرے دھبے",
      "پھلوں پر دھبے",
      "پتوں کو نقصان",
    ],
    urduOrganic: [
      "متاثرہ پتے ہٹا دیں",
      "پودے کی صحت بہتر بنائیں",
    ],
    urduChemical: [
      "تانبے پر مبنی اسپرے استعمال کریں",
    ],
    urduPrevention: [
      "صحت مند پودے استعمال کریں",
      "زیادہ نمی سے گریز کریں",
    ],
  ),

  "Peach healthy": DiseaseInfo(
    cause: "Healthy peach plant.",
    symptoms: [
      "Green leaves",
      "Normal fruit growth",
    ],
    organic: [
      "Apply organic fertilizer",
      "Maintain irrigation",
    ],
    chemical: [
      "No chemical treatment required",
    ],
    prevention: [
      "Regular inspection",
      "Keep orchard clean",
    ],
    urduCause: "یہ صحت مند آڑو کا پودا ہے۔",
    urduSymptoms: [
      "سبز پتے",
      "پھلوں کی معمول کی نشوونما",
    ],
    urduOrganic: [
      "نامیاتی کھاد استعمال کریں",
      "مناسب آبپاشی برقرار رکھیں",
    ],
    urduChemical: [
      "کسی کیمیائی علاج کی ضرورت نہیں",
    ],
    urduPrevention: [
      "باقاعدگی سے معائنہ کریں",
      "باغ کو صاف رکھیں",
    ],
  ),

  // =========================
  // SQUASH
  // =========================

  "Squash Powdery mildew": DiseaseInfo(
    cause: "Fungal disease causing white powder on leaves.",
    symptoms: [
      "White powder on leaves",
      "Leaf curling",
      "Weak growth",
    ],
    organic: [
      "Apply neem oil",
      "Improve air circulation",
    ],
    chemical: [
      "Apply sulfur fungicide",
      "Use recommended fungicide",
    ],
    prevention: [
      "Avoid high humidity",
      "Maintain plant spacing",
    ],
    urduCause: "یہ فنگس کی بیماری ہے جس میں پتوں پر سفید پاؤڈر جیسی تہہ بن جاتی ہے۔",
    urduSymptoms: [
      "پتوں پر سفید پاؤڈر",
      "پتوں کا مڑنا",
      "کمزور نشوونما",
    ],
    urduOrganic: [
      "نیم کا تیل استعمال کریں",
      "ہوا کی آمدورفت بہتر بنائیں",
    ],
    urduChemical: [
      "سلفر فنگس کش دوا استعمال کریں",
      "تجویز کردہ فنگس کش دوا استعمال کریں",
    ],
    urduPrevention: [
      "زیادہ نمی سے گریز کریں",
      "پودوں کے درمیان مناسب فاصلہ رکھیں",
    ],
  ),

  "Squash healthy": DiseaseInfo(
    cause: "Healthy squash plant.",
    symptoms: [
      "Green leaves",
      "Normal growth",
    ],
    organic: [
      "Apply compost",
      "Maintain watering",
    ],
    chemical: [
      "No chemical treatment required",
    ],
    prevention: [
      "Regular monitoring",
      "Control weeds",
    ],
    urduCause: "یہ صحت مند اسکواش کا پودا ہے۔",
    urduSymptoms: [
      "سبز پتے",
      "معمول کی نشوونما",
    ],
    urduOrganic: [
      "کمپوسٹ استعمال کریں",
      "مناسب آبپاشی برقرار رکھیں",
    ],
    urduChemical: [
      "کسی کیمیائی علاج کی ضرورت نہیں",
    ],
    urduPrevention: [
      "باقاعدگی سے نگرانی کریں",
      "جڑی بوٹیوں کو کنٹرول کریں",
    ],
  ),

  // =========================
  // RASPBERRY
  // =========================

  "Raspberry healthy": DiseaseInfo(
    cause: "Healthy raspberry plant with no disease detected.",
    symptoms: [
      "Green healthy leaves",
      "Normal plant growth",
      "Healthy fruits",
    ],
    organic: [
      "Apply organic compost",
      "Maintain proper irrigation",
      "Keep the soil healthy",
    ],
    chemical: [
      "No chemical treatment required",
    ],
    prevention: [
      "Monitor the plant regularly",
      "Remove weeds around the plant",
      "Maintain good air circulation",
    ],
    urduCause:
        "یہ صحت مند رسبیری کا پودا ہے اور کسی بیماری کی نشاندہی نہیں ہوئی۔",
    urduSymptoms: [
      "صحت مند سبز پتے",
      "پودے کی معمول کی نشوونما",
      "صحت مند پھل",
    ],
    urduOrganic: [
      "نامیاتی کمپوسٹ کھاد استعمال کریں",
      "مناسب آبپاشی برقرار رکھیں",
      "مٹی کی صحت برقرار رکھیں",
    ],
    urduChemical: [
      "کسی کیمیائی علاج کی ضرورت نہیں",
    ],
    urduPrevention: [
      "پودے کی باقاعدگی سے نگرانی کریں",
      "پودے کے اردگرد جڑی بوٹیاں ہٹا دیں",
      "ہوا کی اچھی آمدورفت برقرار رکھیں",
    ],
  ),

  // =========================
  // STRAWBERRY
  // =========================

  "Strawberry Leaf scorch": DiseaseInfo(
    cause: "Fungal disease affecting strawberry leaves.",
    symptoms: [
      "Purple-red leaf spots",
      "Leaf drying",
      "Reduced growth",
    ],
    organic: [
      "Remove infected leaves",
      "Improve soil condition",
    ],
    chemical: [
      "Apply recommended fungicide",
    ],
    prevention: [
      "Maintain field hygiene",
      "Avoid excess moisture",
    ],
    urduCause: "یہ اسٹرابیری کے پتوں کو متاثر کرنے والی فنگس کی بیماری ہے۔",
    urduSymptoms: [
      "پتوں پر جامنی سرخ دھبے",
      "پتے خشک ہونا",
      "نشوونما میں کمی",
    ],
    urduOrganic: [
      "متاثرہ پتے ہٹا دیں",
      "مٹی کی حالت بہتر بنائیں",
    ],
    urduChemical: [
      "تجویز کردہ فنگس کش دوا استعمال کریں",
    ],
    urduPrevention: [
      "کھیت کی صفائی برقرار رکھیں",
      "زیادہ نمی سے گریز کریں",
    ],
  ),

  "Strawberry healthy": DiseaseInfo(
    cause: "Healthy strawberry plant.",
    symptoms: [
      "Green leaves",
      "Healthy fruits",
      "Normal growth",
    ],
    organic: [
      "Apply compost",
      "Maintain irrigation",
    ],
    chemical: [
      "No chemical treatment required",
    ],
    prevention: [
      "Regular monitoring",
      "Remove infected plants",
    ],
    urduCause: "یہ صحت مند اسٹرابیری کا پودا ہے۔",
    urduSymptoms: [
      "سبز پتے",
      "صحت مند پھل",
      "معمول کی نشوونما",
    ],
    urduOrganic: [
      "کمپوسٹ استعمال کریں",
      "مناسب آبپاشی برقرار رکھیں",
    ],
    urduChemical: [
      "کسی کیمیائی علاج کی ضرورت نہیں",
    ],
    urduPrevention: [
      "باقاعدگی سے نگرانی کریں",
      "متاثرہ پودے ہٹا دیں",
    ],
  ),
};