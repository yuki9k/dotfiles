<?php

$foo = 'bar';

function baz($args)
{
    for ($i = 0; $i < count($args); $i++) {
        echo $args[i];
    }
}

?>
