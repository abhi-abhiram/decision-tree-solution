// CONSTRAINT creation
// -------------------
//
// Create node uniqueness constraints, ensuring no duplicates for the given node label and ID property exist in the database. This also ensures no duplicates are introduced in future.
//
// NOTE: If your database version is below (not including) 4.4.0, please use the constraint creation syntax below:
// CREATE CONSTRAINT `imp_uniq_Question_id` IF NOT EXISTS
// ON (n: `Question`)
// ASSERT n.`id` IS UNIQUE;
//
// NOTE: The following constraint creation syntax is generated based on the current connected database version 5.14-aura.
CREATE CONSTRAINT `imp_uniq_Question_id` IF NOT EXISTS
FOR (n: `Question`)
REQUIRE (n.`id`) IS UNIQUE;

// :param {
//   idsToSkip: []
// };

// NODE load
// ---------
//
// Load nodes in batches, one node label at a time. Nodes will be created using a MERGE statement to ensure a node with the same label and ID property remains unique. Pre-existing nodes found by a MERGE statement will have their other properties set to the latest values encountered in a load file.
//
// NOTE: Any nodes with IDs in the 'idsToSkip' list parameter will not be loaded.
// LOAD CSV WITH HEADERS FROM ($file_path_root + $file_0) AS row
// WITH row
// WHERE NOT row.`id` IN $idsToSkip AND NOT row.`id` IS NULL
// CALL {
//   WITH row
//   MERGE (n: `Question` { `id`: row.`id` })
//   SET n.`id` = row.`id`
//   SET n.`name` = row.`name`
//   SET n.`question` = row.`email`
//   // Your script contains the datetime datatype. Our app attempts to convert dates to ISO 8601 date format before passing them to the Cypher function.
//   // This conversion cannot be done in a Cypher script load. Please ensure that your CSV file columns are in ISO 8601 date format to ensure equivalent loads.
//   SET n.`createdAt` = datetime(row.`name`)
//   SET n.`variables` = row.`id`
//   SET n.`schemaId` = row.`name`
//   SET n.`context` = row.`id`
//   SET n.`type` = row.`name`
//   SET n.`helptext` = row.`email`
//   SET n.`attachment` = row.`name`
// } IN TRANSACTIONS OF 10000 ROWS;

// Add Nodes

CREATE (n:Question
{
  id: uuid()
  name: 'What is your name?'
  question: 'What is your name?'
  createdAt: datetime('2021-09-01T00:00:00.000Z')
  variables: 'name'
  schemaId: 'name'
  context: 'name'
  type: 'text'
  helptext: 'What is your name?'
  attachment: 'name'
  }),
  (n:Question
  {
    id: uuid()
    name: 'What is your email?'
    question: 'What is your email?'
    createdAt: datetime('2021-09-01T00:00:00.000Z')
    variables: 'email'
    schemaId: 'email'
    context: 'email'
    type: 'email'
    helptext: 'What is your email?'
    attachment: 'email'
  }
  );


// CREATE (Q:Question {
//   id: randomUUID(),
//   name: 'What is your name?',
//   question: 'What is your name?',
//   createdAt: datetime('2021-09-01T00:00:00.000Z'),
//   variables: 'name',
//   schemaId: 'name',
//   context: 'name',
//   type: 'text',
//   helptext: 'What is your name?',
//   attachment: 'name'
// }) return Q;

CREATE (Q:Question {
  id:  randomUUID(),
  name: 'What is your name?',
  question: 'What is your name?',
  createdAt: datetime('2021-09-01T00:00:00.000Z'),
  variables: ['name', 'type'],
  schemaId: 'name',
  context: 'name',
  type: 'text',
  helptext: 'What is your name?',
  attachment: 'name'
}) return Q;