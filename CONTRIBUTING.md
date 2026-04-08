# دليل المساهمة في المشروع

## 1) المبادئ الأساسية

- الالتزام بهيكلية الطبقات: Domain → Application → Infrastructure → API/Presentation.
- الالتزام بالتسمية: `kebab-case` للمجلدات، `PascalCase` للفئات والأنواع، `camelCase` للدوال والمتغيرات.
- أي تغيير معماري يجب أن يكون موثقاً في ADR داخل `docs/adr/`.
- أي تعديل مؤثر وظيفياً يجب تسجيله في `CHANGELOG.md`.

## 2) خط الأساس قبل إعادة الهيكلة

قبل أي Refactor واسع:

1. إنشاء وسم Git لخط الأساس.
2. تشغيل:
   - `bash scripts/analysis/generate_file_hashes.sh . artifacts`
   - `bash scripts/analysis/run_static_analysis.sh . artifacts/static-analysis`
   - `bash scripts/analysis/generate_dependency_graph.sh . artifacts/dependency-graph src/index.ts`
3. حفظ جميع المخرجات كـ artifacts في CI.

## 3) بوابات الجودة الإلزامية

- نجاح lint وtypecheck (عند وجود كود تنفيذي).
- عدم إدخال كسر توافق (Backward Compatibility) دون توثيق صريح وإصدار SemVer مناسب.
- إضافة/تحديث اختبارات Unit/Integration/E2E للتغييرات السلوكية.
- ربط كل تغيير معماري بـ ADR واضح (سياق، قرار، بدائل، آثار).

## 4) استراتيجية الفروع

- `main`: فرع الإنتاج المستقر.
- `develop`: فرع الدمج المستمر.
- `feature/*`: ميزات جديدة.
- `hotfix/*`: إصلاحات عاجلة للإنتاج.

## 5) رسائل الالتزام (Conventional Commits)

- `feat:` ميزة جديدة
- `fix:` إصلاح خطأ
- `refactor:` إعادة هيكلة بدون تغيير سلوكي
- `docs:` تحديث التوثيق
- `test:` إضافة/تحسين الاختبارات
- `ci:` تحديثات خطوط CI/CD
- `chore:` مهام صيانة

## 6) سياسة مراجعة الكود

- لا يُدمج Pull Request بدون مراجعة بشرية.
- يجب تضمين روابط التقارير/الآثار (hashes, static analysis, dependency graph).
- في التغييرات المعمارية الكبيرة: يلزم موافقة صريحة من المالك الفني للمشروع.

المسؤول: مصعب جمال الحلايقة
