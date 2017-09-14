import test from 'tape';
import { sum } from '../src';

test('sum', assert => {
  assert.equal(sum(4, 7), 11);
  assert.end();
});
