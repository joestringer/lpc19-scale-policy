/* int bpf_sk_assign(struct sk_buff *skb, struct bpf_sock *sk,
 *                   u64 flags)
 *  Description
 *    Assign the *sk* to the *skb*.
 *
 *    This operation is only valid from TC ingress path.
 *
 *    The *flags* argument must be zero.
 *  Return
 *    0 on success, or a negative errno in case of failure.
 *
 *    * **-EINVAL**      Unsupported flags specified.
 *    * **-EOPNOTSUPP**: Unsupported operation, for example
 *                       a call from outside of TC ingress.
 *    * **-ENOENT**:     The socket cannot be assigned.
 */
