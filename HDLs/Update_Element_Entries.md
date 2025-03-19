## Update Latest Entry of Element Entry

### HDL

```
SET PURGE_FUTURE_CHANGES Y
METADATA|ElementEntry|ElementEntryId|EffectiveStartDate|EffectiveEndDate|ReplaceLastEffectiveEndDate
MERGE|ElementEntry|1234567890|2014/01/01|2014/04/05|Y
```
ElementEntryId => PAY_ELEMENT_ENTRIES_F.ELEMENT_ENTRY_ID
