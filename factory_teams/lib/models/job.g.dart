// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetJobCollection on Isar {
  IsarCollection<Job> get jobs => getCollection();
}

const JobSchema = CollectionSchema(
  name: 'Job',
  schema:
      '{"name":"Job","idName":"id","properties":[{"name":"Title","type":"String"},{"name":"lengthShiftsWeekday","type":"Long"},{"name":"lengthShiftsWeekend","type":"Long"},{"name":"lid","type":"Long"},{"name":"minPeopleShift1","type":"Long"},{"name":"minPeopleShift2","type":"Long"},{"name":"minPeopleShift3","type":"Long"},{"name":"nrShiftsWeekday","type":"Long"},{"name":"nrShiftsWeekdend","type":"Long"},{"name":"nrWeekdays","type":"Long"},{"name":"nrWeekends","type":"Long"}],"indexes":[{"name":"Title","unique":false,"properties":[{"name":"Title","type":"Hash","caseSensitive":true}]},{"name":"lid","unique":false,"properties":[{"name":"lid","type":"Value","caseSensitive":false}]}],"links":[]}',
  idName: 'id',
  propertyIds: {
    'Title': 0,
    'lengthShiftsWeekday': 1,
    'lengthShiftsWeekend': 2,
    'lid': 3,
    'minPeopleShift1': 4,
    'minPeopleShift2': 5,
    'minPeopleShift3': 6,
    'nrShiftsWeekday': 7,
    'nrShiftsWeekdend': 8,
    'nrWeekdays': 9,
    'nrWeekends': 10
  },
  listProperties: {},
  indexIds: {'Title': 0, 'lid': 1},
  indexValueTypes: {
    'Title': [
      IndexValueType.stringHash,
    ],
    'lid': [
      IndexValueType.long,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _jobGetId,
  setId: _jobSetId,
  getLinks: _jobGetLinks,
  attachLinks: _jobAttachLinks,
  serializeNative: _jobSerializeNative,
  deserializeNative: _jobDeserializeNative,
  deserializePropNative: _jobDeserializePropNative,
  serializeWeb: _jobSerializeWeb,
  deserializeWeb: _jobDeserializeWeb,
  deserializePropWeb: _jobDeserializePropWeb,
  version: 3,
);

int? _jobGetId(Job object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _jobSetId(Job object, int id) {
  object.id = id;
}

List<IsarLinkBase> _jobGetLinks(Job object) {
  return [];
}

void _jobSerializeNative(IsarCollection<Job> collection, IsarRawObject rawObj,
    Job object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.Title;
  final _Title = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_Title.length) as int;
  final value1 = object.lengthShiftsWeekday;
  final _lengthShiftsWeekday = value1;
  final value2 = object.lengthShiftsWeekend;
  final _lengthShiftsWeekend = value2;
  final value3 = object.lid;
  final _lid = value3;
  final value4 = object.minPeopleShift1;
  final _minPeopleShift1 = value4;
  final value5 = object.minPeopleShift2;
  final _minPeopleShift2 = value5;
  final value6 = object.minPeopleShift3;
  final _minPeopleShift3 = value6;
  final value7 = object.nrShiftsWeekday;
  final _nrShiftsWeekday = value7;
  final value8 = object.nrShiftsWeekdend;
  final _nrShiftsWeekdend = value8;
  final value9 = object.nrWeekdays;
  final _nrWeekdays = value9;
  final value10 = object.nrWeekends;
  final _nrWeekends = value10;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _Title);
  writer.writeLong(offsets[1], _lengthShiftsWeekday);
  writer.writeLong(offsets[2], _lengthShiftsWeekend);
  writer.writeLong(offsets[3], _lid);
  writer.writeLong(offsets[4], _minPeopleShift1);
  writer.writeLong(offsets[5], _minPeopleShift2);
  writer.writeLong(offsets[6], _minPeopleShift3);
  writer.writeLong(offsets[7], _nrShiftsWeekday);
  writer.writeLong(offsets[8], _nrShiftsWeekdend);
  writer.writeLong(offsets[9], _nrWeekdays);
  writer.writeLong(offsets[10], _nrWeekends);
}

Job _jobDeserializeNative(IsarCollection<Job> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Job();
  object.Title = reader.readString(offsets[0]);
  object.id = id;
  object.lengthShiftsWeekday = reader.readLong(offsets[1]);
  object.lengthShiftsWeekend = reader.readLong(offsets[2]);
  object.lid = reader.readLong(offsets[3]);
  object.minPeopleShift1 = reader.readLong(offsets[4]);
  object.minPeopleShift2 = reader.readLong(offsets[5]);
  object.minPeopleShift3 = reader.readLong(offsets[6]);
  object.nrShiftsWeekday = reader.readLong(offsets[7]);
  object.nrShiftsWeekdend = reader.readLong(offsets[8]);
  object.nrWeekdays = reader.readLong(offsets[9]);
  object.nrWeekends = reader.readLong(offsets[10]);
  return object;
}

P _jobDeserializePropNative<P>(
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
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _jobSerializeWeb(IsarCollection<Job> collection, Job object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'Title', object.Title);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(
      jsObj, 'lengthShiftsWeekday', object.lengthShiftsWeekday);
  IsarNative.jsObjectSet(
      jsObj, 'lengthShiftsWeekend', object.lengthShiftsWeekend);
  IsarNative.jsObjectSet(jsObj, 'lid', object.lid);
  IsarNative.jsObjectSet(jsObj, 'minPeopleShift1', object.minPeopleShift1);
  IsarNative.jsObjectSet(jsObj, 'minPeopleShift2', object.minPeopleShift2);
  IsarNative.jsObjectSet(jsObj, 'minPeopleShift3', object.minPeopleShift3);
  IsarNative.jsObjectSet(jsObj, 'nrShiftsWeekday', object.nrShiftsWeekday);
  IsarNative.jsObjectSet(jsObj, 'nrShiftsWeekdend', object.nrShiftsWeekdend);
  IsarNative.jsObjectSet(jsObj, 'nrWeekdays', object.nrWeekdays);
  IsarNative.jsObjectSet(jsObj, 'nrWeekends', object.nrWeekends);
  return jsObj;
}

Job _jobDeserializeWeb(IsarCollection<Job> collection, dynamic jsObj) {
  final object = Job();
  object.Title = IsarNative.jsObjectGet(jsObj, 'Title') ?? '';
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.lengthShiftsWeekday =
      IsarNative.jsObjectGet(jsObj, 'lengthShiftsWeekday') ??
          double.negativeInfinity;
  object.lengthShiftsWeekend =
      IsarNative.jsObjectGet(jsObj, 'lengthShiftsWeekend') ??
          double.negativeInfinity;
  object.lid = IsarNative.jsObjectGet(jsObj, 'lid') ?? double.negativeInfinity;
  object.minPeopleShift1 = IsarNative.jsObjectGet(jsObj, 'minPeopleShift1') ??
      double.negativeInfinity;
  object.minPeopleShift2 = IsarNative.jsObjectGet(jsObj, 'minPeopleShift2') ??
      double.negativeInfinity;
  object.minPeopleShift3 = IsarNative.jsObjectGet(jsObj, 'minPeopleShift3') ??
      double.negativeInfinity;
  object.nrShiftsWeekday = IsarNative.jsObjectGet(jsObj, 'nrShiftsWeekday') ??
      double.negativeInfinity;
  object.nrShiftsWeekdend = IsarNative.jsObjectGet(jsObj, 'nrShiftsWeekdend') ??
      double.negativeInfinity;
  object.nrWeekdays =
      IsarNative.jsObjectGet(jsObj, 'nrWeekdays') ?? double.negativeInfinity;
  object.nrWeekends =
      IsarNative.jsObjectGet(jsObj, 'nrWeekends') ?? double.negativeInfinity;
  return object;
}

P _jobDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'Title':
      return (IsarNative.jsObjectGet(jsObj, 'Title') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'lengthShiftsWeekday':
      return (IsarNative.jsObjectGet(jsObj, 'lengthShiftsWeekday') ??
          double.negativeInfinity) as P;
    case 'lengthShiftsWeekend':
      return (IsarNative.jsObjectGet(jsObj, 'lengthShiftsWeekend') ??
          double.negativeInfinity) as P;
    case 'lid':
      return (IsarNative.jsObjectGet(jsObj, 'lid') ?? double.negativeInfinity)
          as P;
    case 'minPeopleShift1':
      return (IsarNative.jsObjectGet(jsObj, 'minPeopleShift1') ??
          double.negativeInfinity) as P;
    case 'minPeopleShift2':
      return (IsarNative.jsObjectGet(jsObj, 'minPeopleShift2') ??
          double.negativeInfinity) as P;
    case 'minPeopleShift3':
      return (IsarNative.jsObjectGet(jsObj, 'minPeopleShift3') ??
          double.negativeInfinity) as P;
    case 'nrShiftsWeekday':
      return (IsarNative.jsObjectGet(jsObj, 'nrShiftsWeekday') ??
          double.negativeInfinity) as P;
    case 'nrShiftsWeekdend':
      return (IsarNative.jsObjectGet(jsObj, 'nrShiftsWeekdend') ??
          double.negativeInfinity) as P;
    case 'nrWeekdays':
      return (IsarNative.jsObjectGet(jsObj, 'nrWeekdays') ??
          double.negativeInfinity) as P;
    case 'nrWeekends':
      return (IsarNative.jsObjectGet(jsObj, 'nrWeekends') ??
          double.negativeInfinity) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _jobAttachLinks(IsarCollection col, int id, Job object) {}

extension JobQueryWhereSort on QueryBuilder<Job, Job, QWhere> {
  QueryBuilder<Job, Job, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<Job, Job, QAfterWhere> anyTitle() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'Title'));
  }

  QueryBuilder<Job, Job, QAfterWhere> anyLid() {
    return addWhereClauseInternal(const IndexWhereClause.any(indexName: 'lid'));
  }
}

extension JobQueryWhere on QueryBuilder<Job, Job, QWhereClause> {
  QueryBuilder<Job, Job, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Job, Job, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<Job, Job, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Job, Job, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Job, Job, QAfterWhereClause> idBetween(
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

  QueryBuilder<Job, Job, QAfterWhereClause> titleEqualTo(String Title) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'Title',
      value: [Title],
    ));
  }

  QueryBuilder<Job, Job, QAfterWhereClause> titleNotEqualTo(String Title) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'Title',
        upper: [Title],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'Title',
        lower: [Title],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'Title',
        lower: [Title],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'Title',
        upper: [Title],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Job, Job, QAfterWhereClause> lidEqualTo(int lid) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'lid',
      value: [lid],
    ));
  }

  QueryBuilder<Job, Job, QAfterWhereClause> lidNotEqualTo(int lid) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'lid',
        upper: [lid],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'lid',
        lower: [lid],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'lid',
        lower: [lid],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'lid',
        upper: [lid],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Job, Job, QAfterWhereClause> lidGreaterThan(
    int lid, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'lid',
      lower: [lid],
      includeLower: include,
    ));
  }

  QueryBuilder<Job, Job, QAfterWhereClause> lidLessThan(
    int lid, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'lid',
      upper: [lid],
      includeUpper: include,
    ));
  }

  QueryBuilder<Job, Job, QAfterWhereClause> lidBetween(
    int lowerLid,
    int upperLid, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'lid',
      lower: [lowerLid],
      includeLower: includeLower,
      upper: [upperLid],
      includeUpper: includeUpper,
    ));
  }
}

extension JobQueryFilter on QueryBuilder<Job, Job, QFilterCondition> {
  QueryBuilder<Job, Job, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'Title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'Title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'Title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'Title',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'Title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'Title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'Title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'Title',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Job, Job, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Job, Job, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Job, Job, QAfterFilterCondition> lengthShiftsWeekdayEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'lengthShiftsWeekday',
      value: value,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> lengthShiftsWeekdayGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'lengthShiftsWeekday',
      value: value,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> lengthShiftsWeekdayLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'lengthShiftsWeekday',
      value: value,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> lengthShiftsWeekdayBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'lengthShiftsWeekday',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> lengthShiftsWeekendEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'lengthShiftsWeekend',
      value: value,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> lengthShiftsWeekendGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'lengthShiftsWeekend',
      value: value,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> lengthShiftsWeekendLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'lengthShiftsWeekend',
      value: value,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> lengthShiftsWeekendBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'lengthShiftsWeekend',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> lidEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'lid',
      value: value,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> lidGreaterThan(
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

  QueryBuilder<Job, Job, QAfterFilterCondition> lidLessThan(
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

  QueryBuilder<Job, Job, QAfterFilterCondition> lidBetween(
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

  QueryBuilder<Job, Job, QAfterFilterCondition> minPeopleShift1EqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'minPeopleShift1',
      value: value,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> minPeopleShift1GreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'minPeopleShift1',
      value: value,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> minPeopleShift1LessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'minPeopleShift1',
      value: value,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> minPeopleShift1Between(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'minPeopleShift1',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> minPeopleShift2EqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'minPeopleShift2',
      value: value,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> minPeopleShift2GreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'minPeopleShift2',
      value: value,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> minPeopleShift2LessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'minPeopleShift2',
      value: value,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> minPeopleShift2Between(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'minPeopleShift2',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> minPeopleShift3EqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'minPeopleShift3',
      value: value,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> minPeopleShift3GreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'minPeopleShift3',
      value: value,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> minPeopleShift3LessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'minPeopleShift3',
      value: value,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> minPeopleShift3Between(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'minPeopleShift3',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> nrShiftsWeekdayEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'nrShiftsWeekday',
      value: value,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> nrShiftsWeekdayGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'nrShiftsWeekday',
      value: value,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> nrShiftsWeekdayLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'nrShiftsWeekday',
      value: value,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> nrShiftsWeekdayBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'nrShiftsWeekday',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> nrShiftsWeekdendEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'nrShiftsWeekdend',
      value: value,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> nrShiftsWeekdendGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'nrShiftsWeekdend',
      value: value,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> nrShiftsWeekdendLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'nrShiftsWeekdend',
      value: value,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> nrShiftsWeekdendBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'nrShiftsWeekdend',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> nrWeekdaysEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'nrWeekdays',
      value: value,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> nrWeekdaysGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'nrWeekdays',
      value: value,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> nrWeekdaysLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'nrWeekdays',
      value: value,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> nrWeekdaysBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'nrWeekdays',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> nrWeekendsEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'nrWeekends',
      value: value,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> nrWeekendsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'nrWeekends',
      value: value,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> nrWeekendsLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'nrWeekends',
      value: value,
    ));
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> nrWeekendsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'nrWeekends',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension JobQueryLinks on QueryBuilder<Job, Job, QFilterCondition> {}

extension JobQueryWhereSortBy on QueryBuilder<Job, Job, QSortBy> {
  QueryBuilder<Job, Job, QAfterSortBy> sortByTitle() {
    return addSortByInternal('Title', Sort.asc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByTitleDesc() {
    return addSortByInternal('Title', Sort.desc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByLengthShiftsWeekday() {
    return addSortByInternal('lengthShiftsWeekday', Sort.asc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByLengthShiftsWeekdayDesc() {
    return addSortByInternal('lengthShiftsWeekday', Sort.desc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByLengthShiftsWeekend() {
    return addSortByInternal('lengthShiftsWeekend', Sort.asc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByLengthShiftsWeekendDesc() {
    return addSortByInternal('lengthShiftsWeekend', Sort.desc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByLid() {
    return addSortByInternal('lid', Sort.asc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByLidDesc() {
    return addSortByInternal('lid', Sort.desc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByMinPeopleShift1() {
    return addSortByInternal('minPeopleShift1', Sort.asc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByMinPeopleShift1Desc() {
    return addSortByInternal('minPeopleShift1', Sort.desc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByMinPeopleShift2() {
    return addSortByInternal('minPeopleShift2', Sort.asc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByMinPeopleShift2Desc() {
    return addSortByInternal('minPeopleShift2', Sort.desc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByMinPeopleShift3() {
    return addSortByInternal('minPeopleShift3', Sort.asc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByMinPeopleShift3Desc() {
    return addSortByInternal('minPeopleShift3', Sort.desc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByNrShiftsWeekday() {
    return addSortByInternal('nrShiftsWeekday', Sort.asc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByNrShiftsWeekdayDesc() {
    return addSortByInternal('nrShiftsWeekday', Sort.desc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByNrShiftsWeekdend() {
    return addSortByInternal('nrShiftsWeekdend', Sort.asc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByNrShiftsWeekdendDesc() {
    return addSortByInternal('nrShiftsWeekdend', Sort.desc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByNrWeekdays() {
    return addSortByInternal('nrWeekdays', Sort.asc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByNrWeekdaysDesc() {
    return addSortByInternal('nrWeekdays', Sort.desc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByNrWeekends() {
    return addSortByInternal('nrWeekends', Sort.asc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByNrWeekendsDesc() {
    return addSortByInternal('nrWeekends', Sort.desc);
  }
}

extension JobQueryWhereSortThenBy on QueryBuilder<Job, Job, QSortThenBy> {
  QueryBuilder<Job, Job, QAfterSortBy> thenByTitle() {
    return addSortByInternal('Title', Sort.asc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByTitleDesc() {
    return addSortByInternal('Title', Sort.desc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByLengthShiftsWeekday() {
    return addSortByInternal('lengthShiftsWeekday', Sort.asc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByLengthShiftsWeekdayDesc() {
    return addSortByInternal('lengthShiftsWeekday', Sort.desc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByLengthShiftsWeekend() {
    return addSortByInternal('lengthShiftsWeekend', Sort.asc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByLengthShiftsWeekendDesc() {
    return addSortByInternal('lengthShiftsWeekend', Sort.desc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByLid() {
    return addSortByInternal('lid', Sort.asc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByLidDesc() {
    return addSortByInternal('lid', Sort.desc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByMinPeopleShift1() {
    return addSortByInternal('minPeopleShift1', Sort.asc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByMinPeopleShift1Desc() {
    return addSortByInternal('minPeopleShift1', Sort.desc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByMinPeopleShift2() {
    return addSortByInternal('minPeopleShift2', Sort.asc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByMinPeopleShift2Desc() {
    return addSortByInternal('minPeopleShift2', Sort.desc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByMinPeopleShift3() {
    return addSortByInternal('minPeopleShift3', Sort.asc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByMinPeopleShift3Desc() {
    return addSortByInternal('minPeopleShift3', Sort.desc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByNrShiftsWeekday() {
    return addSortByInternal('nrShiftsWeekday', Sort.asc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByNrShiftsWeekdayDesc() {
    return addSortByInternal('nrShiftsWeekday', Sort.desc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByNrShiftsWeekdend() {
    return addSortByInternal('nrShiftsWeekdend', Sort.asc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByNrShiftsWeekdendDesc() {
    return addSortByInternal('nrShiftsWeekdend', Sort.desc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByNrWeekdays() {
    return addSortByInternal('nrWeekdays', Sort.asc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByNrWeekdaysDesc() {
    return addSortByInternal('nrWeekdays', Sort.desc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByNrWeekends() {
    return addSortByInternal('nrWeekends', Sort.asc);
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByNrWeekendsDesc() {
    return addSortByInternal('nrWeekends', Sort.desc);
  }
}

extension JobQueryWhereDistinct on QueryBuilder<Job, Job, QDistinct> {
  QueryBuilder<Job, Job, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('Title', caseSensitive: caseSensitive);
  }

  QueryBuilder<Job, Job, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Job, Job, QDistinct> distinctByLengthShiftsWeekday() {
    return addDistinctByInternal('lengthShiftsWeekday');
  }

  QueryBuilder<Job, Job, QDistinct> distinctByLengthShiftsWeekend() {
    return addDistinctByInternal('lengthShiftsWeekend');
  }

  QueryBuilder<Job, Job, QDistinct> distinctByLid() {
    return addDistinctByInternal('lid');
  }

  QueryBuilder<Job, Job, QDistinct> distinctByMinPeopleShift1() {
    return addDistinctByInternal('minPeopleShift1');
  }

  QueryBuilder<Job, Job, QDistinct> distinctByMinPeopleShift2() {
    return addDistinctByInternal('minPeopleShift2');
  }

  QueryBuilder<Job, Job, QDistinct> distinctByMinPeopleShift3() {
    return addDistinctByInternal('minPeopleShift3');
  }

  QueryBuilder<Job, Job, QDistinct> distinctByNrShiftsWeekday() {
    return addDistinctByInternal('nrShiftsWeekday');
  }

  QueryBuilder<Job, Job, QDistinct> distinctByNrShiftsWeekdend() {
    return addDistinctByInternal('nrShiftsWeekdend');
  }

  QueryBuilder<Job, Job, QDistinct> distinctByNrWeekdays() {
    return addDistinctByInternal('nrWeekdays');
  }

  QueryBuilder<Job, Job, QDistinct> distinctByNrWeekends() {
    return addDistinctByInternal('nrWeekends');
  }
}

extension JobQueryProperty on QueryBuilder<Job, Job, QQueryProperty> {
  QueryBuilder<Job, String, QQueryOperations> TitleProperty() {
    return addPropertyNameInternal('Title');
  }

  QueryBuilder<Job, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Job, int, QQueryOperations> lengthShiftsWeekdayProperty() {
    return addPropertyNameInternal('lengthShiftsWeekday');
  }

  QueryBuilder<Job, int, QQueryOperations> lengthShiftsWeekendProperty() {
    return addPropertyNameInternal('lengthShiftsWeekend');
  }

  QueryBuilder<Job, int, QQueryOperations> lidProperty() {
    return addPropertyNameInternal('lid');
  }

  QueryBuilder<Job, int, QQueryOperations> minPeopleShift1Property() {
    return addPropertyNameInternal('minPeopleShift1');
  }

  QueryBuilder<Job, int, QQueryOperations> minPeopleShift2Property() {
    return addPropertyNameInternal('minPeopleShift2');
  }

  QueryBuilder<Job, int, QQueryOperations> minPeopleShift3Property() {
    return addPropertyNameInternal('minPeopleShift3');
  }

  QueryBuilder<Job, int, QQueryOperations> nrShiftsWeekdayProperty() {
    return addPropertyNameInternal('nrShiftsWeekday');
  }

  QueryBuilder<Job, int, QQueryOperations> nrShiftsWeekdendProperty() {
    return addPropertyNameInternal('nrShiftsWeekdend');
  }

  QueryBuilder<Job, int, QQueryOperations> nrWeekdaysProperty() {
    return addPropertyNameInternal('nrWeekdays');
  }

  QueryBuilder<Job, int, QQueryOperations> nrWeekendsProperty() {
    return addPropertyNameInternal('nrWeekends');
  }
}
