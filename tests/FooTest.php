<?php declare(strict_types=1);

namespace hollodotme\phpunit11\Tests;

use hollodotme\phpunit11\Foo;
use PHPUnit\Framework\TestCase;

final class FooTest extends TestCase
{
	public function testBar() : void
	{
		$foo = new Foo();
		self::assertSame( 'baz', $foo->bar() );
	}
}