int tcp_v4_early_demux(struct sk_buff *skb) {
    // ... snipped: validate packet type, tcphdr offsets

    struct sock *sk = __inet_lookup_established(dev_net(skb->dev),
                       &tcp_hashinfo, iph->saddr, th->source,
                       iph->daddr, ntohs(th->dest),
                       skb->skb_iif, inet_sdif(skb));
    if (sk) {
        skb->sk = sk;
        skb->destructor = sock_edemux;
        if (sk_fullsock(sk)) {
            struct dst_entry *dst = READ_ONCE(sk->sk_rx_dst);

            if (dst)
                dst = dst_check(dst, 0);
            if (dst &&
                inet_sk(sk)->rx_dst_ifindex == skb->skb_iif)
                skb_dst_set_noref(skb, dst);
        }
    }
    return 0;
}
