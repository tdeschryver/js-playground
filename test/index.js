import test from 'ava';
import {sum} from '../src';

test('sum', t => {
	t.is(sum(4, 7), 11);
});
