// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetEmployeeCollection on Isar {
  IsarCollection<Employee> get employees => getCollection();
}

const EmployeeSchema = CollectionSchema(
  name: 'Employee',
  schema:
      '{"name":"Employee","idName":"id","properties":[{"name":"jobtitle","type":"String"},{"name":"lid","type":"Long"},{"name":"norm","type":"Long"},{"name":"nrVacationDays","type":"Long"},{"name":"phone","type":"Long"},{"name":"salary","type":"Double"},{"name":"uid","type":"Long"},{"name":"url","type":"String"}],"indexes":[{"name":"lid_jobtitle","unique":false,"properties":[{"name":"lid","type":"Value","caseSensitive":false},{"name":"jobtitle","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: 'id',
  propertyIds: {
    'jobtitle': 0,
    'lid': 1,
    'norm': 2,
    'nrVacationDays': 3,
    'phone': 4,
    'salary': 5,
    'uid': 6,
    'url': 7
  },
  listProperties: {},
  indexIds: {'lid_jobtitle': 0},
  indexValueTypes: {
    'lid_jobtitle': [
      IndexValueType.long,
      IndexValueType.stringHash,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _employeeGetId,
  setId: _employeeSetId,
  getLinks: _employeeGetLinks,
  attachLinks: _employeeAttachLinks,
  serializeNative: _employeeSerializeNative,
  deserializeNative: _employeeDeserializeNative,
  deserializePropNative: _employeeDeserializePropNative,
  serializeWeb: _employeeSerializeWeb,
  deserializeWeb: _employeeDeserializeWeb,
  deserializePropWeb: _employeeDeserializePropWeb,
  version: 3,
);

int? _employeeGetId(Employee object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _employeeSetId(Employee object, int id) {
  object.id = id;
}

List<IsarLinkBase> _employeeGetLinks(Employee object) {
  return [];
}

void _employeeSerializeNative(
    IsarCollection<Employee> collection,
    IsarRawObject rawObj,
    Employee object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.jobtitle;
  final _jobtitle = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_jobtitle.length) as int;
  final value1 = object.lid;
  final _lid = value1;
  final value2 = object.norm;
  final _norm = value2;
  final value3 = object.nrVacationDays;
  final _nrVacationDays = value3;
  final value4 = object.phone;
  final _phone = value4;
  final value5 = object.salary;
  final _salary = value5;
  final value6 = object.uid;
  final _uid = value6;
  final value7 = object.url;
  final _url = IsarBinaryWriter.utf8Encoder.convert(value7);
  dynamicSize += (_url.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _jobtitle);
  writer.writeLong(offsets[1], _lid);
  writer.writeLong(offsets[2], _norm);
  writer.writeLong(offsets[3], _nrVacationDays);
  writer.writeLong(offsets[4], _phone);
  writer.writeDouble(offsets[5], _salary);
  writer.writeLong(offsets[6], _uid);
  writer.writeBytes(offsets[7], _url);
}

Employee _employeeDeserializeNative(IsarCollection<Employee> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Employee();
  object.id = id;
  object.jobtitle = reader.readString(offsets[0]);
  object.lid = reader.readLong(offsets[1]);
  object.norm = reader.readLong(offsets[2]);
  object.nrVacationDays = reader.readLong(offsets[3]);
  object.phone = reader.readLong(offsets[4]);
  object.salary = reader.readDouble(offsets[5]);
  object.uid = reader.readLong(offsets[6]);
  object.url = reader.readString(offsets[7]);
  return object;
}

P _employeeDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _employeeSerializeWeb(
    IsarCollection<Employee> collection, Employee object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'jobtitle', object.jobtitle);
  IsarNative.jsObjectSet(jsObj, 'lid', object.lid);
  IsarNative.jsObjectSet(jsObj, 'norm', object.norm);
  IsarNative.jsObjectSet(jsObj, 'nrVacationDays', object.nrVacationDays);
  IsarNative.jsObjectSet(jsObj, 'phone', object.phone);
  IsarNative.jsObjectSet(jsObj, 'salary', object.salary);
  IsarNative.jsObjectSet(jsObj, 'uid', object.uid);
  IsarNative.jsObjectSet(jsObj, 'url', object.url);
  return jsObj;
}

Employee _employeeDeserializeWeb(
    IsarCollection<Employee> collection, dynamic jsObj) {
  final object = Employee();
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.jobtitle = IsarNative.jsObjectGet(jsObj, 'jobtitle') ?? '';
  object.lid = IsarNative.jsObjectGet(jsObj, 'lid') ?? double.negativeInfinity;
  object.norm =
      IsarNative.jsObjectGet(jsObj, 'norm') ?? double.negativeInfinity;
  object.nrVacationDays = IsarNative.jsObjectGet(jsObj, 'nrVacationDays') ??
      double.negativeInfinity;
  object.phone =
      IsarNative.jsObjectGet(jsObj, 'phone') ?? double.negativeInfinity;
  object.salary =
      IsarNative.jsObjectGet(jsObj, 'salary') ?? double.negativeInfinity;
  object.uid = IsarNative.jsObjectGet(jsObj, 'uid') ?? double.negativeInfinity;
  object.url = IsarNative.jsObjectGet(jsObj, 'url') ?? '';
  return object;
}

P _employeeDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'jobtitle':
      return (IsarNative.jsObjectGet(jsObj, 'jobtitle') ?? '') as P;
    case 'lid':
      return (IsarNative.jsObjectGet(jsObj, 'lid') ?? double.negativeInfinity)
          as P;
    case 'norm':
      return (IsarNative.jsObjectGet(jsObj, 'norm') ?? double.negativeInfinity)
          as P;
    case 'nrVacationDays':
      return (IsarNative.jsObjectGet(jsObj, 'nrVacationDays') ??
          double.negativeInfinity) as P;
    case 'phone':
      return (IsarNative.jsObjectGet(jsObj, 'phone') ?? double.negativeInfinity)
          as P;
    case 'salary':
      return (IsarNative.jsObjectGet(jsObj, 'salary') ??
          double.negativeInfinity) as P;
    case 'uid':
      return (IsarNative.jsObjectGet(jsObj, 'uid') ?? double.negativeInfinity)
          as P;
    case 'url':
      return (IsarNative.jsObjectGet(jsObj, 'url') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _employeeAttachLinks(IsarCollection col, int id, Employee object) {}

extension EmployeeQueryWhereSort on QueryBuilder<Employee, Employee, QWhere> {
  QueryBuilder<Employee, Employee, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<Employee, Employee, QAfterWhere> anyLidJobtitle() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'lid_jobtitle'));
  }
}

extension EmployeeQueryWhere on QueryBuilder<Employee, Employee, QWhereClause> {
  QueryBuilder<Employee, Employee, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<Employee, Employee, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Employee, Employee, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Employee, Employee, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterWhereClause> lidEqualTo(int lid) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'lid_jobtitle',
      value: [lid],
    ));
  }

  QueryBuilder<Employee, Employee, QAfterWhereClause> lidNotEqualTo(int lid) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'lid_jobtitle',
        upper: [lid],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'lid_jobtitle',
        lower: [lid],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'lid_jobtitle',
        lower: [lid],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'lid_jobtitle',
        upper: [lid],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Employee, Employee, QAfterWhereClause> lidGreaterThan(
    int lid, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'lid_jobtitle',
      lower: [lid],
      includeLower: include,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterWhereClause> lidLessThan(
    int lid, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'lid_jobtitle',
      upper: [lid],
      includeUpper: include,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterWhereClause> lidBetween(
    int lowerLid,
    int upperLid, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'lid_jobtitle',
      lower: [lowerLid],
      includeLower: includeLower,
      upper: [upperLid],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterWhereClause> lidJobtitleEqualTo(
      int lid, String jobtitle) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'lid_jobtitle',
      value: [lid, jobtitle],
    ));
  }

  QueryBuilder<Employee, Employee, QAfterWhereClause> lidJobtitleNotEqualTo(
      int lid, String jobtitle) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'lid_jobtitle',
        upper: [lid, jobtitle],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'lid_jobtitle',
        lower: [lid, jobtitle],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'lid_jobtitle',
        lower: [lid, jobtitle],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'lid_jobtitle',
        upper: [lid, jobtitle],
        includeUpper: false,
      ));
    }
  }
}

extension EmployeeQueryFilter
    on QueryBuilder<Employee, Employee, QFilterCondition> {
  QueryBuilder<Employee, Employee, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> jobtitleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'jobtitle',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> jobtitleGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'jobtitle',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> jobtitleLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'jobtitle',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> jobtitleBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'jobtitle',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> jobtitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'jobtitle',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> jobtitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'jobtitle',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> jobtitleContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'jobtitle',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> jobtitleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'jobtitle',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> lidEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'lid',
      value: value,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> lidGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'lid',
      value: value,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> lidLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'lid',
      value: value,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> lidBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'lid',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> normEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'norm',
      value: value,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> normGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'norm',
      value: value,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> normLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'norm',
      value: value,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> normBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'norm',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> nrVacationDaysEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'nrVacationDays',
      value: value,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      nrVacationDaysGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'nrVacationDays',
      value: value,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      nrVacationDaysLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'nrVacationDays',
      value: value,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> nrVacationDaysBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'nrVacationDays',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> phoneEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'phone',
      value: value,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> phoneGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'phone',
      value: value,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> phoneLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'phone',
      value: value,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> phoneBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'phone',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> salaryGreaterThan(
      double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'salary',
      value: value,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> salaryLessThan(
      double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'salary',
      value: value,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> salaryBetween(
      double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'salary',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> uidEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'uid',
      value: value,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> uidGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'uid',
      value: value,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> uidLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'uid',
      value: value,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> uidBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'uid',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> urlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'url',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> urlGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'url',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> urlLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'url',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> urlBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'url',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'url',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'url',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> urlContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'url',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> urlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'url',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension EmployeeQueryLinks
    on QueryBuilder<Employee, Employee, QFilterCondition> {}

extension EmployeeQueryWhereSortBy
    on QueryBuilder<Employee, Employee, QSortBy> {
  QueryBuilder<Employee, Employee, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByJobtitle() {
    return addSortByInternal('jobtitle', Sort.asc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByJobtitleDesc() {
    return addSortByInternal('jobtitle', Sort.desc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByLid() {
    return addSortByInternal('lid', Sort.asc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByLidDesc() {
    return addSortByInternal('lid', Sort.desc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByNorm() {
    return addSortByInternal('norm', Sort.asc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByNormDesc() {
    return addSortByInternal('norm', Sort.desc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByNrVacationDays() {
    return addSortByInternal('nrVacationDays', Sort.asc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByNrVacationDaysDesc() {
    return addSortByInternal('nrVacationDays', Sort.desc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByPhone() {
    return addSortByInternal('phone', Sort.asc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByPhoneDesc() {
    return addSortByInternal('phone', Sort.desc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortBySalary() {
    return addSortByInternal('salary', Sort.asc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortBySalaryDesc() {
    return addSortByInternal('salary', Sort.desc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByUid() {
    return addSortByInternal('uid', Sort.asc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByUidDesc() {
    return addSortByInternal('uid', Sort.desc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByUrl() {
    return addSortByInternal('url', Sort.asc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByUrlDesc() {
    return addSortByInternal('url', Sort.desc);
  }
}

extension EmployeeQueryWhereSortThenBy
    on QueryBuilder<Employee, Employee, QSortThenBy> {
  QueryBuilder<Employee, Employee, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByJobtitle() {
    return addSortByInternal('jobtitle', Sort.asc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByJobtitleDesc() {
    return addSortByInternal('jobtitle', Sort.desc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByLid() {
    return addSortByInternal('lid', Sort.asc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByLidDesc() {
    return addSortByInternal('lid', Sort.desc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByNorm() {
    return addSortByInternal('norm', Sort.asc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByNormDesc() {
    return addSortByInternal('norm', Sort.desc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByNrVacationDays() {
    return addSortByInternal('nrVacationDays', Sort.asc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByNrVacationDaysDesc() {
    return addSortByInternal('nrVacationDays', Sort.desc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByPhone() {
    return addSortByInternal('phone', Sort.asc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByPhoneDesc() {
    return addSortByInternal('phone', Sort.desc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenBySalary() {
    return addSortByInternal('salary', Sort.asc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenBySalaryDesc() {
    return addSortByInternal('salary', Sort.desc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByUid() {
    return addSortByInternal('uid', Sort.asc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByUidDesc() {
    return addSortByInternal('uid', Sort.desc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByUrl() {
    return addSortByInternal('url', Sort.asc);
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByUrlDesc() {
    return addSortByInternal('url', Sort.desc);
  }
}

extension EmployeeQueryWhereDistinct
    on QueryBuilder<Employee, Employee, QDistinct> {
  QueryBuilder<Employee, Employee, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByJobtitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('jobtitle', caseSensitive: caseSensitive);
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByLid() {
    return addDistinctByInternal('lid');
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByNorm() {
    return addDistinctByInternal('norm');
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByNrVacationDays() {
    return addDistinctByInternal('nrVacationDays');
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByPhone() {
    return addDistinctByInternal('phone');
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctBySalary() {
    return addDistinctByInternal('salary');
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByUid() {
    return addDistinctByInternal('uid');
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByUrl(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('url', caseSensitive: caseSensitive);
  }
}

extension EmployeeQueryProperty
    on QueryBuilder<Employee, Employee, QQueryProperty> {
  QueryBuilder<Employee, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Employee, String, QQueryOperations> jobtitleProperty() {
    return addPropertyNameInternal('jobtitle');
  }

  QueryBuilder<Employee, int, QQueryOperations> lidProperty() {
    return addPropertyNameInternal('lid');
  }

  QueryBuilder<Employee, int, QQueryOperations> normProperty() {
    return addPropertyNameInternal('norm');
  }

  QueryBuilder<Employee, int, QQueryOperations> nrVacationDaysProperty() {
    return addPropertyNameInternal('nrVacationDays');
  }

  QueryBuilder<Employee, int, QQueryOperations> phoneProperty() {
    return addPropertyNameInternal('phone');
  }

  QueryBuilder<Employee, double, QQueryOperations> salaryProperty() {
    return addPropertyNameInternal('salary');
  }

  QueryBuilder<Employee, int, QQueryOperations> uidProperty() {
    return addPropertyNameInternal('uid');
  }

  QueryBuilder<Employee, String, QQueryOperations> urlProperty() {
    return addPropertyNameInternal('url');
  }
}
