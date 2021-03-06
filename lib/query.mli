(*
 * Copyright (c) 2005-2006 Tim Deegan <tjd@phlegethon.org>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 *)

(**  Map DNS query-response mechanism onto trie database.

     @author Tim Deegan
     @author Richard Mortier <mort\@cantab.net> (documentation)
*)

(** Partially-marshalled query response; that is, it has been uncompacted from
    the compact {! Trie} representation, but not yet rendered into a {!
    Cstruct.buf }.
*)
type query_answer = {
  rcode : Packet.rcode;
  aa: bool;
  answer: Packet.rr list;
  authority: Packet.rr list;
  additional: Packet.rr list;
}

(** Answer a query about {! domain_name}, given a query type {! q_type} and a
    {! Trie} of DNS data.

    @return the {! query_answer}
*)
val answer_query : ?dnssec:bool -> 
  Name.domain_name -> Packet.q_type -> Trie.dnstrie -> query_answer
