all:
	iverilog -o test *.v
	vvp test

vcs:
	vcs -sv -full64 -fsdb -kdb seq.v tb.v

verdi:
	verdi tb.v seq.v



clean:
	rm -rf *.vcd
	rm -rf test
	rm -rf novas*
	rm -rf csrc
	rm -rf simv*
	rm -rf *.dump
	rm -rf *.fsdb *.key verdiLog
