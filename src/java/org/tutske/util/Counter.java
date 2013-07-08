package org.tutske.util;

public class Counter {

	private static int n = 0;

	public Counter () { super (); }

	public int getCount () { return n; }
	public synchronized void increase () { n++; }
	public synchronized void reset () { n = 0; }

}
