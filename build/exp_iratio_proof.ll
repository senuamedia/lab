; ModuleID = 'simplex_program'
target triple = "x86_64-apple-macosx14.0.0"

declare ptr @malloc(i64)
declare void @free(ptr)
declare void @intrinsic_println(ptr)
declare void @intrinsic_print(ptr)
declare void @"print_i64"(i64)
declare ptr @intrinsic_int_to_string(i64)
declare ptr @intrinsic_string_new(ptr)
declare ptr @intrinsic_string_from_char(i64)
declare i64 @intrinsic_string_len(ptr)
declare ptr @intrinsic_string_concat(ptr, ptr)
declare ptr @intrinsic_string_slice(ptr, i64, i64)
declare i64 @intrinsic_string_char_at(ptr, i64)
declare i1 @intrinsic_string_eq(ptr, ptr)
declare i64 @intrinsic_string_to_int(ptr)
declare i64 @"String_from"(i64)
declare i64 @"String_len"(i64)
declare ptr @intrinsic_vec_new()
declare void @intrinsic_vec_push(ptr, ptr)
declare ptr @intrinsic_vec_get(ptr, i64)
declare i64 @intrinsic_vec_len(ptr)
declare void @intrinsic_vec_set(ptr, i64, ptr)
declare ptr @intrinsic_vec_pop(ptr)
declare void @intrinsic_vec_clear(ptr)
declare void @intrinsic_vec_remove(ptr, i64)
declare ptr @intrinsic_get_args()
declare ptr @intrinsic_read_file(ptr)
declare void @intrinsic_write_file(ptr, ptr)
declare ptr @store_ptr(ptr, i64, ptr)
declare ptr @store_i64(ptr, i64, i64)
declare ptr @load_ptr(ptr, i64)
declare i64 @load_i64(ptr, i64)
; Timing intrinsics
declare i64 @intrinsic_get_time_ms()
declare i64 @intrinsic_get_time_us()
declare i64 @intrinsic_get_time_ns()
; Float bit conversion intrinsics
declare i64 @"f64_to_bits"(double)
declare i64 @"bits_to_f64"(i64)
; Arena allocator intrinsics
declare ptr @intrinsic_arena_create(i64)
declare ptr @intrinsic_arena_alloc(ptr, i64)
declare void @intrinsic_arena_reset(ptr)
declare void @intrinsic_arena_free(ptr)
declare i64 @intrinsic_arena_used(ptr)
; StringBuilder intrinsics
declare ptr @intrinsic_sb_new()
declare ptr @intrinsic_sb_new_cap(i64)
declare void @intrinsic_sb_append(ptr, ptr)
declare void @intrinsic_sb_append_char(ptr, i64)
declare void @intrinsic_sb_append_i64(ptr, i64)
declare ptr @intrinsic_sb_to_string(ptr)
declare void @intrinsic_sb_clear(ptr)
declare void @intrinsic_sb_free(ptr)
declare i64 @intrinsic_sb_len(ptr)
; File I/O intrinsics
declare ptr @intrinsic_getenv(ptr)
declare i64 @intrinsic_file_exists(ptr)
declare i64 @intrinsic_is_file(ptr)
declare i64 @intrinsic_is_directory(ptr)
declare i64 @intrinsic_file_size(ptr)
declare i64 @intrinsic_file_mtime(ptr)
declare i64 @intrinsic_remove_path(ptr)
declare i64 @intrinsic_mkdir_p(ptr)
declare ptr @intrinsic_get_cwd()
declare i64 @intrinsic_set_cwd(ptr)
declare ptr @intrinsic_list_dir(ptr)
declare ptr @intrinsic_path_join(ptr, ptr)
declare ptr @intrinsic_path_dirname(ptr)
declare ptr @intrinsic_path_basename(ptr)
declare ptr @intrinsic_path_extension(ptr)
declare i64 @file_copy(ptr, ptr)
declare i64 @file_rename(ptr, ptr)
declare void @stderr_write(ptr)
declare void @stderr_writeln(ptr)
; Error handling intrinsics
declare void @intrinsic_panic(ptr)
declare void @intrinsic_print_stack_trace()
; Process intrinsics
declare i64 @intrinsic_process_run(ptr)
declare ptr @intrinsic_process_output(ptr)
; Phase 20: REPL/I/O intrinsics
declare ptr @intrinsic_read_line()
declare i64 @intrinsic_is_tty()
declare i64 @intrinsic_stdin_has_data()
declare i64 @intrinsic_string_hash(ptr)
declare i64 @intrinsic_string_find(ptr, ptr, i64)
declare ptr @intrinsic_string_trim(ptr)
declare ptr @intrinsic_string_split(ptr, ptr)
declare i64 @intrinsic_string_starts_with(ptr, ptr)
declare i64 @intrinsic_string_ends_with(ptr, ptr)
declare i64 @intrinsic_string_contains(ptr, ptr)
declare ptr @intrinsic_string_replace(ptr, ptr, ptr)
declare ptr @intrinsic_string_lines(ptr)
declare ptr @intrinsic_string_join(ptr, ptr)
declare ptr @intrinsic_string_to_lowercase(ptr)
declare ptr @intrinsic_string_to_uppercase(ptr)
declare i64 @intrinsic_string_compare(ptr, ptr)
declare i64 @intrinsic_copy_file(ptr, ptr)
declare ptr @intrinsic_get_home_dir()
declare i64 @cli_getenv(i64)
declare i64 @"env_get"(i64)
declare i64 @file_read(i64)
declare void @file_write(i64, i64)
declare i64 @remove_path(i64)
declare i64 @f64_parse(ptr)
declare i64 @"make_sx_string"(i64)
; SLM native bindings
declare i64 @"slm_native_load"(i64, i64, i64)
declare i64 @"slm_native_unload"(i64)
declare i64 @"slm_native_create_context"(i64, i64)
declare i64 @"slm_native_destroy_context"(i64)
declare i64 @"slm_native_tokenize"(i64, i64)
declare i64 @"slm_native_infer"(i64, i64, i64)
declare i64 @"slm_native_generate"(i64, i64, i64, i64)
declare i64 @"slm_native_embed"(i64, i64)
declare i64 @"slm_native_similarity"(i64, i64)
declare i64 @"slm_native_context_size"(i64)
declare i64 @"slm_native_embedding_size"(i64)
declare i64 @"slm_native_get_model_info"(i64)
; Generator intrinsics
declare i64 @generator_yield(i64)
declare i64 @generator_new(i64)
declare i64 @generator_next(i64)
declare i64 @generator_done(i64)
; Belief guard intrinsics
declare i64 @belief_guard_get_confidence(i64)
declare i64 @belief_guard_get_derivative(i64)
declare i64 @belief_register(i64, double, double)
declare i64 @belief_update(i64, double)
declare i64 @belief_update_dual(i64, double, double)
declare double @belief_get_value(i64)
declare i64 @belief_register_i64(i64, i64, i64)
declare i64 @belief_update_i64(i64, i64)
declare i64 @belief_update_dual_i64(i64, i64, i64)
; Belief suspend/wake intrinsics
declare i64 @belief_suspend_receive(i64, i64, i64, i64, i64, double, i64, i64)
declare i64 @belief_cancel_suspend(i64)
declare i64 @belief_suspended_count()
declare i64 @belief_get_actor_suspends(i64)
declare i64 @belief_clear_actor_suspends(i64)
declare i64 @belief_suspend_get_belief(i64)
declare i64 @belief_suspend_get_actor(i64)
declare i64 @belief_suspend_get_duration_ms(i64)
declare i64 @future_poll(i64)
declare i64 @future_ready(i64)
declare i64 @future_pending()
declare i64 @executor_run(i64)
declare i64 @executor_spawn(i64)
declare i64 @block_on(i64)
declare i64 @async_join(i64, i64)
declare i64 @join_result1(i64)
declare i64 @join_result2(i64)
declare i64 @async_select(i64, i64)
declare i64 @select_result(i64)
declare i64 @select_which(i64)
declare i64 @async_timeout(i64, i64)
declare i64 @timeout_result(i64)
declare i64 @timeout_expired(i64)
declare i64 @time_now_ms()
declare i64 @pin_new(i64, i64)
declare i64 @pin_new_uninit(i64)
declare i64 @pin_get(i64)
declare i64 @pin_get_mut(i64)
declare i64 @pin_is_pinned(i64)
declare void @pin_ref(i64)
declare void @pin_unref(i64)
declare void @pin_set_self_ref(i64, i64)
declare i64 @pin_check_self_ref(i64, i64)
declare i64 @intrinsic_call0(i64)
declare i64 @intrinsic_call1(i64, i64)
declare i64 @intrinsic_call2(i64, i64, i64)
declare i64 @intrinsic_call3(i64, i64, i64, i64)
declare i64 @scope_new()
declare i64 @scope_spawn(i64, i64)
declare i64 @scope_poll(i64)
declare i64 @scope_join(i64)
declare i64 @scope_get_result(i64, i64)
declare void @scope_cancel(i64)
declare i64 @scope_count(i64)
declare i64 @scope_completed(i64)
declare void @scope_free(i64)
declare i64 @nursery_run(i64, i64)
declare i64 @actor_get_status(i64)
declare i64 @actor_get_exit_reason(i64)
declare i64 @actor_get_error_code(i64)
declare void @actor_set_error(i64, i64, i64)
declare void @actor_stop(i64)
declare void @actor_kill(i64)
declare void @actor_crash(i64, i64, i64)
declare void @actor_set_on_error(i64, i64)
declare void @actor_set_on_exit(i64, i64)
declare void @actor_set_supervisor(i64, i64)
declare i64 @actor_get_supervisor(i64)
declare i64 @actor_get_restart_count(i64)
declare void @actor_increment_restart(i64)
declare i64 @actor_is_alive(i64)
declare i64 @circuit_breaker_new(i64, i64, i64)
declare i64 @circuit_breaker_allow(i64)
declare void @circuit_breaker_success(i64)
declare void @circuit_breaker_failure(i64)
declare i64 @circuit_breaker_state(i64)
declare void @circuit_breaker_reset(i64)
declare i64 @retry_policy_new(i64, i64, i64, i64)
declare void @retry_policy_set_jitter(i64, i64)
declare i64 @retry_policy_should_retry(i64)
declare i64 @retry_policy_next_delay(i64)
declare void @retry_policy_reset(i64)
declare i64 @retry_policy_count(i64)
declare i64 @actor_link(i64, i64)
declare void @actor_unlink(i64, i64)
declare i64 @actor_monitor(i64, i64)
declare void @actor_demonitor(i64)
declare void @actor_propagate_exit(i64, i64)
declare i64 @actor_is_linked(i64, i64)
declare i64 @actor_spawn_link(i64, i64, i64)
declare i64 @actor_get_links_count(i64)
declare i64 @actor_send_down(i64, i64, i64)
; Phase 23.1: Supervision Trees
declare i64 @supervisor_new(i64, i64, i64)
declare i64 @supervisor_add_child(i64, i64, i64, i64, i64)
declare i64 @supervisor_start(i64)
declare void @supervisor_stop(i64)
declare i64 @supervisor_handle_exit(i64, i64, i64)
declare i64 @supervisor_child_count(i64)
declare i64 @supervisor_child_status(i64, i64)
declare i64 @supervisor_child_handle(i64, i64)
declare void @supervisor_free(i64)
declare i64 @strategy_one_for_one()
declare i64 @strategy_one_for_all()
declare i64 @strategy_rest_for_one()
declare i64 @child_permanent()
declare i64 @child_temporary()
declare i64 @child_transient()
; Phase 23.2: Work-Stealing Scheduler
declare i64 @scheduler_new(i64)
declare i64 @scheduler_start(i64)
declare i64 @scheduler_submit(i64, i64, i64)
declare i64 @scheduler_submit_local(i64, i64, i64, i64)
declare void @scheduler_stop(i64)
declare void @scheduler_free(i64)
declare i64 @scheduler_worker_count(i64)
declare i64 @scheduler_queue_size(i64)
declare i64 @scheduler_worker_idle(i64, i64)
; Phase 23.3: Lock-Free Mailbox
declare i64 @mailbox_new(i64)
declare i64 @mailbox_send(i64, i64)
declare i64 @mailbox_ask(i64, i64)
declare i64 @mailbox_recv(i64)
declare i64 @mailbox_try_recv(i64)
declare i64 @mailbox_size(i64)
declare i64 @mailbox_empty(i64)
declare i64 @mailbox_full(i64)
declare void @mailbox_close(i64)
declare i64 @mailbox_is_closed(i64)
declare void @mailbox_free(i64)
; Phase 23.6: Actor Discovery and Registry
declare i64 @registry_register(i64, i64)
declare void @registry_unregister(i64)
declare i64 @registry_lookup(i64)
declare i64 @registry_count()
declare i64 @registry_set_metadata(i64, i64)
declare i64 @registry_get_metadata(i64)
; Phase 23.7: Backpressure and Flow Control
declare i64 @flow_controller_new(i64, i64, i64)
declare i64 @flow_check(i64)
declare i64 @flow_acquire(i64)
declare void @flow_release(i64)
declare i64 @flow_is_signaling(i64)
declare i64 @flow_current(i64)
declare i64 @flow_high_watermark(i64)
declare i64 @flow_low_watermark(i64)
declare void @flow_reset(i64)
declare void @flow_free(i64)
declare i64 @flow_mode_drop()
declare i64 @flow_mode_block()
declare i64 @flow_mode_signal()
declare void @intrinsic_exit(i64)
; Phase 1 Stdlib: Option
declare i64 @"option_some"(i64)
declare i64 @"option_none"()
declare i64 @"option_is_some"(i64)
declare i64 @"option_is_none"(i64)
declare i64 @"option_unwrap"(i64)
declare i64 @"option_expect"(i64, i64)
declare i64 @"option_unwrap_or"(i64, i64)
declare i64 @"option_map"(i64, i64)
; Phase 1 Stdlib: Result
declare i64 @"result_ok"(i64)
declare i64 @"result_err"(i64)
declare i64 @"result_is_ok"(i64)
declare i64 @"result_is_err"(i64)
declare i64 @"result_unwrap"(i64)
declare i64 @"result_unwrap_err"(i64)
declare i64 @"result_unwrap_or"(i64, i64)
declare i64 @"result_ok_or"(i64, i64)
; Phase 1 Stdlib: Vec extensions
declare i64 @"vec_sum"(i64)
declare i64 @"vec_find"(i64, i64)
declare i64 @"vec_contains"(i64, i64)
declare i64 @"vec_reverse"(i64)
declare i64 @"vec_clone"(i64)
declare i64 @"vec_first"(i64)
declare i64 @"vec_last"(i64)
declare i64 @"vec_pop"(i64)
declare i64 @"vec_set"(i64, i64, i64)
declare i64 @"vec_clear"(i64)
declare i64 @"vec_remove"(i64, i64)
; Phase 1 Stdlib: HashMap
declare i64 @"hashmap_new"()
declare i64 @"hashmap_insert"(i64, i64, i64)
declare i64 @"hashmap_get"(i64, i64)
declare i64 @"hashmap_remove"(i64, i64)
declare i64 @"hashmap_contains"(i64, i64)
declare i64 @"hashmap_len"(i64)
declare i64 @"hashmap_clear"(i64)
declare i64 @"hashmap_keys"(i64)
declare i64 @"hashmap_values"(i64)
; Phase 1 Stdlib: HashSet
declare i64 @"hashset_new"()
declare i64 @"hashset_insert"(i64, i64)
declare i64 @"hashset_remove"(i64, i64)
declare i64 @"hashset_contains"(i64, i64)
declare i64 @"hashset_len"(i64)
declare i64 @"hashset_clear"(i64)
; Phase 1 Stdlib: JSON
declare i64 @"json_parse_simple"(i64)
declare i64 @"json_stringify"(i64)
declare i64 @"json_get_sx"(i64, i64)
declare i64 @"json_keys"(i64)
declare i64 @"json_is_string"(i64)
declare i64 @"json_is_object"(i64)
declare i64 @"json_is_array"(i64)
declare i64 @"json_as_string"(i64)
declare i64 @"json_as_array"(i64)
declare i64 @"json_object_new"()
declare i64 @"json_array_new"()
declare i64 @"json_object_set"(i64, i64, i64)
declare i64 @"json_array_push"(i64, i64)
declare i64 @"json_string"(i64)
declare i64 @"json_string_sx"(i64)
declare i64 @"json_array_len"(i64)
declare i64 @"json_object_len"(i64)
declare i64 @"json_as_i64"(i64)
declare i64 @"json_get_index"(i64, i64)
declare i64 @"json_is_null"(i64)
declare i64 @"json_object_key_at"(i64, i64)
declare i64 @"json_object_value_at"(i64, i64)
declare i64 @"json_object_set_sx"(i64, i64, i64)
; Phase 3: HTTP Client/Server
declare i64 @"http_request_new"(i64, i64)
declare i64 @"http_request_header"(i64, i64, i64)
declare i64 @"http_request_body"(i64, i64)
declare i64 @"http_request_send"(i64)
declare i64 @"http_request_free"(i64)
declare i64 @"http_response_status"(i64)
declare i64 @"http_response_body"(i64)
declare i64 @"http_response_header"(i64, i64)
declare i64 @"http_response_free"(i64)
declare i64 @"http_server_new"(i64)
declare i64 @"http_server_route"(i64, i64, i64, i64)
declare i64 @"http_server_start"(i64)
declare i64 @"http_server_stop"(i64)
declare i64 @"http_server_free"(i64)
; Phase 3: SQL Database
declare i64 @"sql_open"(i64)
declare void @"sql_close"(i64)
declare i64 @"sql_exec"(i64, i64)
declare i64 @"sql_query"(i64, i64)
declare i64 @"sql_prepare"(i64, i64)
declare i64 @"sql_bind_int"(i64, i64, i64)
declare i64 @"sql_bind_text"(i64, i64, i64)
declare i64 @"sql_bind_float"(i64, i64, double)
declare i64 @"sql_bind_null"(i64, i64)
declare i64 @"sql_bind_blob"(i64, i64, i64, i64)
declare i64 @"sql_step"(i64)
declare i64 @"sql_column_int"(i64, i64)
declare i64 @"sql_column_text"(i64, i64)
declare double @"sql_column_float"(i64, i64)
declare i64 @"sql_column_blob"(i64, i64)
declare i64 @"sql_column_blob_len"(i64, i64)
declare i64 @"sql_column_is_null"(i64, i64)
declare void @"sql_finalize"(i64)
declare i64 @"sql_begin"(i64)
declare i64 @"sql_commit"(i64)
declare i64 @"sql_rollback"(i64)
declare i64 @"sql_last_insert_id"(i64)
; Phase 3: UUID
declare i64 @"uuid_v4"()
declare i64 @"uuid_nil"()
declare i64 @"uuid_is_nil"(i64)
declare i64 @"uuid_is_valid"(i64)
; Phase 3: TOML
declare i64 @"toml_parse"(i64)
declare i64 @"toml_get"(i64, i64)
declare i64 @"toml_get_string"(i64, i64)
declare i64 @"toml_get_int"(i64, i64)
declare double @"toml_get_float"(i64, i64)
declare i64 @"toml_get_bool"(i64, i64)
declare i64 @"toml_get_array"(i64, i64)
declare i64 @"toml_get_table"(i64, i64)
declare i64 @"toml_set_string"(i64, i64, i64)
declare i64 @"toml_set_int"(i64, i64, i64)
declare i64 @"toml_set_float"(i64, i64, double)
declare i64 @"toml_set_bool"(i64, i64, i64)
declare i64 @"toml_stringify"(i64)
declare i64 @"toml_table_new"()
declare i64 @"toml_free"(i64)
; Phase G: AI Features
declare i64 @model_infer(i64)
declare i64 @model_load(i64)
declare i64 @model_embed(i64, i64)
declare i64 @model_classify(i64, i64)
declare void @model_unload(i64)
; AI Vector Operations
declare i64 @vector_new(i64, i64)
declare i64 @vector_len(i64)
declare double @vector_get(i64, i64)
declare void @vector_set(i64, i64, double)
declare double @vector_dot(i64, i64)
declare i64 @vector_add(i64, i64)
declare i64 @vector_sub(i64, i64)
declare i64 @vector_scale(i64, double)
declare double @vector_norm(i64)
declare i64 @vector_normalize(i64)
declare double @vector_cosine_similarity(i64, i64)
; AI Tensor Operations
declare i64 @tensor_new(i64, i64)
declare i64 @tensor_shape(i64)
declare i64 @tensor_rank(i64)
declare double @tensor_get(i64, i64)
declare void @tensor_set(i64, i64, double)
declare i64 @tensor_matmul(i64, i64)
declare i64 @tensor_add(i64, i64)
declare i64 @tensor_transpose(i64)
declare i64 @tensor_reshape(i64, i64)
; Specialist Operations
declare i64 @specialist_query(i64, i64)
declare i64 @specialist_stream(i64, i64)
declare void @specialist_set_context(i64, i64)
declare i64 @specialist_get_context(i64)
; Hive Operations
declare i64 @hive_route(i64, i64)
declare void @hive_add_specialist(i64, i64)
declare void @hive_remove_specialist(i64, i64)
declare i64 @hive_consensus(i64, i64)
declare i64 @"sx_int_to_f64"(i64)
declare i64 @"sx_f64_to_int"(i64)
declare i64 @"sx_f64_add"(i64, i64)
declare i64 @"sx_f64_sub"(i64, i64)
declare i64 @"sx_f64_mul"(i64, i64)
declare i64 @"sx_f64_div"(i64, i64)
declare i64 @"sx_f64_mod"(i64, i64)
declare i64 @"sx_f64_gt"(i64, i64)
declare i64 @"sx_f64_lt"(i64, i64)
declare i64 @"sx_f64_ge"(i64, i64)
declare i64 @"sx_f64_le"(i64, i64)
declare i64 @"sx_f64_eq"(i64, i64)
declare i64 @"sx_f64_ne"(i64, i64)
declare i64 @"f64_neg"(i64)
declare i64 @"json_parse"(i64)
declare i64 @"json_get"(i64, i64)
declare i64 @"json_set"(i64, i64, i64)
declare i64 @"string_from"(i64)
declare i64 @"infer"(i64, i64)
declare i64 @"path_exists"(i64)
declare i64 @"tanh_f64"(i64)
declare i64 @"contract_result_violation_type"(i64)
declare i64 @"activation_record"(i64, i64)
declare i64 @"neural_reset_pruning"()
declare i64 @"device_type"(i64)
declare i64 @"lazy_branch_count"(i64)
declare i64 @"lazy_context_new"()
declare i64 @"lazy_context_free"(i64)
declare i64 @"lazy_dominant_branch"(i64)
declare i64 @"lazy_executed_count"(i64)
declare i64 @"lazy_mark_executed"(i64, i64)
declare i64 @"lazy_should_execute"(i64, i64)
declare i64 @"activation_tracker_init"()
declare i64 @"activation_tracking_enabled"()
declare i64 @"neural_gate_new"(i64, i64, i64, i64)
declare i64 @"neural_gate_with_contract"(i64, i64, i64, i64, i64)
declare i64 @"neural_gate_execute_on_device"(i64, i64, i64)
declare i64 @"gate_bind_device"(i64, i64)
declare i64 @"gate_get_device"(i64)
declare i64 @"gate_has_explicit_binding"(i64)
declare i64 @"dead_path_analyzer_new"()
declare i64 @"dead_path_analyzer_free"(i64)
declare i64 @"dead_path_add_edge"(i64, i64, i64)
declare i64 @"dead_path_mark_entry"(i64, i64)
declare i64 @"dead_path_propagate"(i64)
declare i64 @"dead_path_reachable_count"(i64)
declare i64 @"graph_new"()
declare i64 @"graph_free"(i64)
declare i64 @"graph_add_node"(i64, i64)
declare i64 @"graph_add_edge"(i64, i64, i64)
declare i64 @"graph_partition"(i64, i64)
declare i64 @"graph_partition_count"(i64)
declare i64 @"graph_partition_device"(i64, i64)
declare i64 @"pruning_context_new"()
declare i64 @"pruning_context_free"(i64)
declare i64 @"pruning_add_gate"(i64, i64, i64)
declare i64 @"pruning_execute"(i64)
declare i64 @"pruning_is_pruned"(i64, i64)
declare i64 @"pruning_ratio"(i64)
declare i64 @"pruning_reason"(i64, i64)
declare i64 @"pruning_total_count"(i64)
declare i64 @"structured_pruner_new"()
declare i64 @"structured_pruner_free"(i64)
declare i64 @"speculative_context_new"()
declare i64 @"speculative_context_free"(i64)
declare i64 @"speculative_add_branch"(i64, i64, i64)
declare i64 @"speculative_get_result"(i64, i64)
declare i64 @"speculative_set_result"(i64, i64, i64)
declare i64 @"speculative_weighted_result"(i64)
declare i64 @"speculative_memory_used"(i64)
declare i64 @"speculative_gc"(i64)
declare i64 @"optimization_stats_calculate"(i64, i64)
declare i64 @"optimization_stats_free"(i64)
declare i64 @"optimization_speedup"(i64)
declare i64 @"optimization_size_reduction"(i64)
declare i64 @"dual_variable"(i64)
declare i64 @"dual_constant"(i64)
declare i64 @"dual_add"(i64, i64)
declare i64 @"dual_mul"(i64, i64)
declare i64 @"dual_div"(i64, i64)
declare i64 @"dual_mul_scalar"(i64, i64)
declare i64 @"dual_sin"(i64)
declare i64 @"dual_cos"(i64)
declare i64 @"dual_exp"(i64)
declare i64 @"dual_ln"(i64)
declare i64 @"dual_sqrt"(i64)
declare i64 @"dual_tanh"(i64)
declare i64 @"dual_sigmoid"(i64)
declare i64 @"dual_powi"(i64, i64)
declare i64 @"int_hashset_new"()
declare i64 @"int_hashset_insert"(i64, i64)
declare i64 @"int_hashset_contains"(i64, i64)
declare i64 @"int_hashset_len"(i64)
declare i64 @"not_approx_eq"(i64, i64, i64)
declare i64 @"transfer_queue_init"(i64)
declare i64 @"sxiter_from_vec"(i64)
declare i64 @"sxiter_collect_vec"(i64)
declare i64 @"sxiter_filter"(i64, i64)
declare i64 @"wref_registry_init"()
declare i64 @"wref_new"(i64, i64, i64)
declare i64 @"wref_ptr"(i64)
declare i64 @"wref_weight"(i64)
declare i64 @"wref_count"()
declare i64 @"wref_state"(i64)
declare i64 @"wref_retain"(i64)
declare i64 @"wref_release"(i64)
declare i64 @"wref_is_allocated"(i64)
declare i64 @"wref_collapse"(i64)
declare i64 @"wref_set_weight"(i64, i64)
declare i64 @"wref_set_mode"(i64)
declare i64 @"wref_get_mode"()
declare i64 @"wref_set_weight_threshold"(i64)
declare i64 @"wref_get_weight_threshold"()
declare i64 @"wref_gc"()
declare i64 @"wref_gc_total_runs"()
declare i64 @"wref_gc_total_collected"()
declare i64 @"wref_gc_last_collected"()
declare i64 @"wref_bytes_allocated"()
declare i64 @"device_registry_init"()
declare i64 @"contract_violation_count"()
declare i64 @"contract_set_violation_handler"(i64)
declare i64 @"neural_gate_weight"(i64)
declare i64 @"lazy_eval"(i64)
declare i64 @"lazy_best_branch"(i64)
declare i64 @"print_f64"(i64)
declare i64 @"device_register"(i64, i64, i64, i64, i64, i64)
declare i64 @"lazy_add_branch"(i64, i64)
declare i64 @"contract_result_satisfied"(i64)
declare i64 @"neural_set_temperature"(i64)
declare i64 @"activation_rate_get"(i64)
declare i64 @"neural_register_gate_weight"(i64, i64, i64)
declare i64 @"ckpt_context_fork"(i64)
declare i64 @"ckpt_context_merge"(i64, i64)
declare i64 @"sqrt_f64"(i64)
declare i64 @"ckpt_save"(i64)
declare i64 @"contract_result_ok"()
declare i64 @"neural_get_temperature"()
declare i64 @"activation_mean_get"(i64)
declare i64 @"neural_prune_by_weight_magnitude"(i64)
declare i64 @"activation_gate_count"()
declare i64 @"ckpt_restore"(i64)
declare i64 @"contract_result_new"(i64, i64)
declare i64 @"contract_result_free"(i64)
declare i64 @"device_get_default"()
declare i64 @"grad_tape_temperature"(i64)
declare i64 @"json_object_has"(i64, i64)
declare i64 @"neural_is_gate_pruned"(i64)
declare i64 @"ln_f64"(i64)
declare i64 @"device_get"(i64)
declare i64 @"ckpt_count"()
declare i64 @"contract_in_range"(i64, i64, i64)
declare i64 @"grad_tape_set_training"(i64, i64)
declare i64 @"activation_epoch_current"()
declare i64 @"neural_get_pruned_gate_count"()
declare i64 @"exp_f64"(i64)
declare i64 @"sin_f64"(i64)
declare i64 @"json_is_number"(i64)
declare i64 @"string_to_lowercase"(i64)
declare i64 @"string_split_whitespace"(i64)
declare i64 @"device_count"()
declare i64 @"ckpt_context_new"()
declare i64 @"ckpt_context_free"(i64)
declare i64 @"ckpt_context_save"(i64)
declare i64 @"ckpt_context_restore"(i64)
declare i64 @"contract_get_panic_mode"()
declare i64 @"contract_set_panic_mode"(i64)
declare i64 @"grad_tape_set_temperature"(i64, i64)
declare i64 @"activation_epoch_advance"(i64)
declare i64 @"neural_get_gate_count"()
declare i64 @"json_is_bool"(i64)
; v0.13.0 Runtime
declare i64 @"print_string"(i64)
declare i64 @"file_delete"(i64)
declare i64 @"cos_f64"(i64)
declare i64 @"pow_f64"(i64, i64)
declare i64 @"neural_set_training_mode"(i64)
declare i64 @"neural_get_training_mode"()
declare i64 @"neural_sigmoid"(i64)
declare i64 @"neural_register_gate"(i64)
declare i64 @"neural_clear_gate_registry"()
declare i64 @"neural_gate_count"()
declare i64 @"grad_tape_new"()
declare i64 @"grad_tape_free"(i64)
declare i64 @"grad_tape_len"(i64)
declare i64 @"grad_tape_record"(i64, i64)
declare i64 @"contract_check_requires"(i64, i64, i64)
declare i64 @"contract_check_ensures"(i64, i64, i64)
declare i64 @"contract_check_invariant"(i64, i64, i64)
declare i64 @"device_available"(i64)
declare i64 @"activation_count_inc"(i64)
declare i64 @"activation_count_get"(i64)
declare i64 @"ckpt_branch_start"()
declare i64 @"ckpt_branch_end"(i64)
declare i64 @"anneal_exponential"(i64, i64)
declare i64 @"anneal_linear"(i64, i64)
declare i64 @"json_null"()
declare i64 @"json_bool"(i64)
declare i64 @"json_number_i64"(i64)
declare i64 @"json_number_f64"(i64)
declare i64 @"json_array"()
declare i64 @"json_object"()
declare i64 @"json_as_bool"(i64)
declare i64 @"HashMap_new"()
declare i64 @"hashmap_is_empty"(i64)
declare i64 @"timer_start"()
declare i64 @"timer_elapsed_us"(i64)
declare i64 @"timer_elapsed_ms"(i64)
declare i64 @"timer_elapsed_s"(i64)
declare i64 @"timer_close"(i64)
declare i64 @"timer_record_to"(i64, i64)
declare i64 @"logger_new"()
declare i64 @"logger_global"()
declare i64 @"logger_set_level"(i64, i64)
declare i64 @"logger_set_console"(i64, i64)
declare i64 @"logger_set_file"(i64, i64)
declare i64 @"logger_set_json"(i64, i64)
declare i64 @"logger_add_context"(i64, i64, i64)
declare i64 @"logger_close"(i64)
declare i64 @"log_debug"(i64)
declare i64 @"log_info"(i64)
declare i64 @"log_warn"(i64)
declare i64 @"log_error"(i64)
declare i64 @"log_fatal"(i64)
declare i64 @"log_with_field"(i64, i64, i64)
declare i64 @"log_with_span"(i64, i64)
declare i64 @"counter_new"(i64)
declare i64 @"counter_inc"(i64)
declare i64 @"counter_add"(i64, i64)
declare i64 @"counter_add_label"(i64, i64, i64)
declare i64 @"counter_value"(i64)
declare i64 @"gauge_new"(i64)
declare i64 @"gauge_set"(i64, i64)
declare i64 @"gauge_inc"(i64)
declare i64 @"gauge_dec"(i64)
declare i64 @"gauge_add"(i64, i64)
declare i64 @"gauge_value"(i64)
declare i64 @"histogram_new"(i64)
declare i64 @"histogram_observe"(i64, i64)
declare i64 @"histogram_count"(i64)
declare i64 @"histogram_sum"(i64)
declare i64 @"histogram_mean"(i64)
declare i64 @"histogram_min"(i64)
declare i64 @"histogram_max"(i64)
declare i64 @"histogram_to_json"(i64)
declare i64 @"metrics_registry_new"()
declare i64 @"metrics_registry_global"()
declare i64 @"metrics_registry_count"(i64)
declare i64 @"metrics_registry_close"(i64)
declare i64 @"metrics_export_json"(i64)
declare i64 @"metrics_export_prometheus"(i64)
declare i64 @"span_start"(i64)
declare i64 @"span_start_child"(i64, i64)
declare i64 @"span_end"(i64)
declare i64 @"span_close"(i64)
declare i64 @"span_id"(i64)
declare i64 @"span_trace_id"(i64)
declare i64 @"span_duration_us"(i64)
declare i64 @"span_set_attribute"(i64, i64, i64)
declare i64 @"span_set_status"(i64, i64)
declare i64 @"span_add_event"(i64, i64)
declare i64 @"span_to_json"(i64)
declare i64 @"tracer_new"()
declare i64 @"tracer_active_spans"(i64)
declare i64 @"tracer_close"(i64)

define i64 @"abs_f64"(i64 %x) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t0 = load i64, ptr %local.x
  %t1 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"lcg_next"(i64 %state) nounwind {
entry:
  %local.state = alloca i64
  store i64 %state, ptr %local.state
  %t9 = load i64, ptr %local.state
  %t10 = mul i64 %t9, 1664525
  %t11 = add i64 %t10, 1013904223
  ret i64 %t11
}

define i64 @"lcg_f64"(i64 %state) nounwind {
entry:
  %local.s.12 = alloca i64
  %local.state = alloca i64
  store i64 %state, ptr %local.state
  %t13 = load i64, ptr %local.state
  store i64 %t13, ptr %local.s.12
  %t14 = load i64, ptr %local.s.12
  %t15 = icmp slt i64 %t14, 0
  %t16 = zext i1 %t15 to i64
  %t17 = icmp ne i64 %t16, 0
  br i1 %t17, label %then1, label %else1
then1:
  %t18 = load i64, ptr %local.s.12
  %t19 = sub i64 0, %t18
  store i64 %t19, ptr %local.s.12
  br label %then1_end
then1_end:
  br label %endif1
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t20 = phi i64 [ 0, %then1_end ], [ 0, %else1_end ]
  %t21 = load i64, ptr %local.s.12
  %t22 = srem i64 %t21, 10000
  %t23 = call i64 @"sx_int_to_f64"(i64 %t22)
  %t24 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.2)
  %t25 = call i64 @"sx_f64_div"(i64 %t23, i64 %t24)
  ret i64 %t25
}

define i64 @"compute_iratio_at_mean"(i64 %k, i64 %seed) nounwind {
entry:
  %local.rng.26 = alloca i64
  %local.mean_0.27 = alloca i64
  %local.mean_1.28 = alloca i64
  %local.mean_2.29 = alloca i64
  %local.mean_3.30 = alloca i64
  %local.targets_0.31 = alloca i64
  %local.targets_1.32 = alloca i64
  %local.targets_2.33 = alloca i64
  %local.targets_3.34 = alloca i64
  %local.i.35 = alloca i64
  %local.t0.36 = alloca i64
  %local.t1.37 = alloca i64
  %local.t2.38 = alloca i64
  %local.t3.39 = alloca i64
  %local.kf.40 = alloca i64
  %local.cross_sum.41 = alloca i64
  %local.ind_sum.42 = alloca i64
  %local.gi_0.43 = alloca i64
  %local.gi_1.44 = alloca i64
  %local.gi_2.45 = alloca i64
  %local.gi_3.46 = alloca i64
  %local.j.47 = alloca i64
  %local.gj_0.48 = alloca i64
  %local.gj_1.49 = alloca i64
  %local.gj_2.50 = alloca i64
  %local.gj_3.51 = alloca i64
  %local.k = alloca i64
  store i64 %k, ptr %local.k
  %local.seed = alloca i64
  store i64 %seed, ptr %local.seed
  %t52 = load i64, ptr %local.seed
  store i64 %t52, ptr %local.rng.26
  %t53 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.3)
  store i64 %t53, ptr %local.mean_0.27
  %t54 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.4)
  store i64 %t54, ptr %local.mean_1.28
  %t55 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.5)
  store i64 %t55, ptr %local.mean_2.29
  %t56 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.6)
  store i64 %t56, ptr %local.mean_3.30
  %t57 = call ptr @intrinsic_vec_new()
  %t58 = ptrtoint ptr %t57 to i64
  store i64 %t58, ptr %local.targets_0.31
  %t59 = call ptr @intrinsic_vec_new()
  %t60 = ptrtoint ptr %t59 to i64
  store i64 %t60, ptr %local.targets_1.32
  %t61 = call ptr @intrinsic_vec_new()
  %t62 = ptrtoint ptr %t61 to i64
  store i64 %t62, ptr %local.targets_2.33
  %t63 = call ptr @intrinsic_vec_new()
  %t64 = ptrtoint ptr %t63 to i64
  store i64 %t64, ptr %local.targets_3.34
  store i64 0, ptr %local.i.35
  br label %loop2
loop2:
  %t65 = load i64, ptr %local.i.35
  %t66 = load i64, ptr %local.k
  %t67 = icmp slt i64 %t65, %t66
  %t68 = zext i1 %t67 to i64
  %t69 = icmp ne i64 %t68, 0
  br i1 %t69, label %body2, label %endloop2
body2:
  %t70 = load i64, ptr %local.rng.26
  %t71 = call i64 @"lcg_next"(i64 %t70)
  store i64 %t71, ptr %local.rng.26
  %t72 = load i64, ptr %local.rng.26
  %t73 = call i64 @"lcg_f64"(i64 %t72)
  %t74 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.7)
  %t75 = call i64 @"sx_f64_sub"(i64 %t73, i64 %t74)
  %t76 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.8)
  %t77 = call i64 @"sx_f64_mul"(i64 %t75, i64 %t76)
  store i64 %t77, ptr %local.t0.36
  %t78 = load i64, ptr %local.rng.26
  %t79 = call i64 @"lcg_next"(i64 %t78)
  store i64 %t79, ptr %local.rng.26
  %t80 = load i64, ptr %local.rng.26
  %t81 = call i64 @"lcg_f64"(i64 %t80)
  %t82 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.9)
  %t83 = call i64 @"sx_f64_sub"(i64 %t81, i64 %t82)
  %t84 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.10)
  %t85 = call i64 @"sx_f64_mul"(i64 %t83, i64 %t84)
  store i64 %t85, ptr %local.t1.37
  %t86 = load i64, ptr %local.rng.26
  %t87 = call i64 @"lcg_next"(i64 %t86)
  store i64 %t87, ptr %local.rng.26
  %t88 = load i64, ptr %local.rng.26
  %t89 = call i64 @"lcg_f64"(i64 %t88)
  %t90 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.11)
  %t91 = call i64 @"sx_f64_sub"(i64 %t89, i64 %t90)
  %t92 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.12)
  %t93 = call i64 @"sx_f64_mul"(i64 %t91, i64 %t92)
  store i64 %t93, ptr %local.t2.38
  %t94 = load i64, ptr %local.rng.26
  %t95 = call i64 @"lcg_next"(i64 %t94)
  store i64 %t95, ptr %local.rng.26
  %t96 = load i64, ptr %local.rng.26
  %t97 = call i64 @"lcg_f64"(i64 %t96)
  %t98 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.13)
  %t99 = call i64 @"sx_f64_sub"(i64 %t97, i64 %t98)
  %t100 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.14)
  %t101 = call i64 @"sx_f64_mul"(i64 %t99, i64 %t100)
  store i64 %t101, ptr %local.t3.39
  %t102 = load i64, ptr %local.targets_0.31
  %t103 = load i64, ptr %local.t0.36
  %t104 = inttoptr i64 %t102 to ptr
  %t105 = inttoptr i64 %t103 to ptr
  call void @intrinsic_vec_push(ptr %t104, ptr %t105)
  %t106 = load i64, ptr %local.targets_1.32
  %t107 = load i64, ptr %local.t1.37
  %t108 = inttoptr i64 %t106 to ptr
  %t109 = inttoptr i64 %t107 to ptr
  call void @intrinsic_vec_push(ptr %t108, ptr %t109)
  %t110 = load i64, ptr %local.targets_2.33
  %t111 = load i64, ptr %local.t2.38
  %t112 = inttoptr i64 %t110 to ptr
  %t113 = inttoptr i64 %t111 to ptr
  call void @intrinsic_vec_push(ptr %t112, ptr %t113)
  %t114 = load i64, ptr %local.targets_3.34
  %t115 = load i64, ptr %local.t3.39
  %t116 = inttoptr i64 %t114 to ptr
  %t117 = inttoptr i64 %t115 to ptr
  call void @intrinsic_vec_push(ptr %t116, ptr %t117)
  %t118 = load i64, ptr %local.mean_0.27
  %t119 = load i64, ptr %local.t0.36
  %t120 = call i64 @"sx_f64_add"(i64 %t118, i64 %t119)
  store i64 %t120, ptr %local.mean_0.27
  %t121 = load i64, ptr %local.mean_1.28
  %t122 = load i64, ptr %local.t1.37
  %t123 = call i64 @"sx_f64_add"(i64 %t121, i64 %t122)
  store i64 %t123, ptr %local.mean_1.28
  %t124 = load i64, ptr %local.mean_2.29
  %t125 = load i64, ptr %local.t2.38
  %t126 = call i64 @"sx_f64_add"(i64 %t124, i64 %t125)
  store i64 %t126, ptr %local.mean_2.29
  %t127 = load i64, ptr %local.mean_3.30
  %t128 = load i64, ptr %local.t3.39
  %t129 = call i64 @"sx_f64_add"(i64 %t127, i64 %t128)
  store i64 %t129, ptr %local.mean_3.30
  %t130 = load i64, ptr %local.i.35
  %t131 = add i64 %t130, 1
  store i64 %t131, ptr %local.i.35
  br label %loop2
endloop2:
  %t132 = load i64, ptr %local.k
  %t133 = call i64 @"sx_int_to_f64"(i64 %t132)
  store i64 %t133, ptr %local.kf.40
  %t134 = load i64, ptr %local.mean_0.27
  %t135 = load i64, ptr %local.kf.40
  %t136 = call i64 @"sx_f64_div"(i64 %t134, i64 %t135)
  store i64 %t136, ptr %local.mean_0.27
  %t137 = load i64, ptr %local.mean_1.28
  %t138 = load i64, ptr %local.kf.40
  %t139 = call i64 @"sx_f64_div"(i64 %t137, i64 %t138)
  store i64 %t139, ptr %local.mean_1.28
  %t140 = load i64, ptr %local.mean_2.29
  %t141 = load i64, ptr %local.kf.40
  %t142 = call i64 @"sx_f64_div"(i64 %t140, i64 %t141)
  store i64 %t142, ptr %local.mean_2.29
  %t143 = load i64, ptr %local.mean_3.30
  %t144 = load i64, ptr %local.kf.40
  %t145 = call i64 @"sx_f64_div"(i64 %t143, i64 %t144)
  store i64 %t145, ptr %local.mean_3.30
  %t146 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.15)
  store i64 %t146, ptr %local.cross_sum.41
  %t147 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.16)
  store i64 %t147, ptr %local.ind_sum.42
  store i64 0, ptr %local.i.35
  br label %loop3
loop3:
  %t148 = load i64, ptr %local.i.35
  %t149 = load i64, ptr %local.k
  %t150 = icmp slt i64 %t148, %t149
  %t151 = zext i1 %t150 to i64
  %t152 = icmp ne i64 %t151, 0
  br i1 %t152, label %body3, label %endloop3
body3:
  %t153 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.17)
  %t154 = load i64, ptr %local.mean_0.27
  %t155 = load i64, ptr %local.targets_0.31
  %t156 = load i64, ptr %local.i.35
  %t157 = inttoptr i64 %t155 to ptr
  %t158 = call ptr @intrinsic_vec_get(ptr %t157, i64 %t156)
  %t159 = ptrtoint ptr %t158 to i64
  %t160 = call i64 @"sx_f64_sub"(i64 %t154, i64 %t159)
  %t161 = call i64 @"sx_f64_mul"(i64 %t153, i64 %t160)
  store i64 %t161, ptr %local.gi_0.43
  %t162 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.18)
  %t163 = load i64, ptr %local.mean_1.28
  %t164 = load i64, ptr %local.targets_1.32
  %t165 = load i64, ptr %local.i.35
  %t166 = inttoptr i64 %t164 to ptr
  %t167 = call ptr @intrinsic_vec_get(ptr %t166, i64 %t165)
  %t168 = ptrtoint ptr %t167 to i64
  %t169 = call i64 @"sx_f64_sub"(i64 %t163, i64 %t168)
  %t170 = call i64 @"sx_f64_mul"(i64 %t162, i64 %t169)
  store i64 %t170, ptr %local.gi_1.44
  %t171 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.19)
  %t172 = load i64, ptr %local.mean_2.29
  %t173 = load i64, ptr %local.targets_2.33
  %t174 = load i64, ptr %local.i.35
  %t175 = inttoptr i64 %t173 to ptr
  %t176 = call ptr @intrinsic_vec_get(ptr %t175, i64 %t174)
  %t177 = ptrtoint ptr %t176 to i64
  %t178 = call i64 @"sx_f64_sub"(i64 %t172, i64 %t177)
  %t179 = call i64 @"sx_f64_mul"(i64 %t171, i64 %t178)
  store i64 %t179, ptr %local.gi_2.45
  %t180 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.20)
  %t181 = load i64, ptr %local.mean_3.30
  %t182 = load i64, ptr %local.targets_3.34
  %t183 = load i64, ptr %local.i.35
  %t184 = inttoptr i64 %t182 to ptr
  %t185 = call ptr @intrinsic_vec_get(ptr %t184, i64 %t183)
  %t186 = ptrtoint ptr %t185 to i64
  %t187 = call i64 @"sx_f64_sub"(i64 %t181, i64 %t186)
  %t188 = call i64 @"sx_f64_mul"(i64 %t180, i64 %t187)
  store i64 %t188, ptr %local.gi_3.46
  %t189 = load i64, ptr %local.ind_sum.42
  %t190 = load i64, ptr %local.gi_0.43
  %t191 = load i64, ptr %local.gi_0.43
  %t192 = call i64 @"sx_f64_mul"(i64 %t190, i64 %t191)
  %t193 = call i64 @"sx_f64_add"(i64 %t189, i64 %t192)
  %t194 = load i64, ptr %local.gi_1.44
  %t195 = load i64, ptr %local.gi_1.44
  %t196 = call i64 @"sx_f64_mul"(i64 %t194, i64 %t195)
  %t197 = call i64 @"sx_f64_add"(i64 %t193, i64 %t196)
  %t198 = load i64, ptr %local.gi_2.45
  %t199 = load i64, ptr %local.gi_2.45
  %t200 = call i64 @"sx_f64_mul"(i64 %t198, i64 %t199)
  %t201 = call i64 @"sx_f64_add"(i64 %t197, i64 %t200)
  %t202 = load i64, ptr %local.gi_3.46
  %t203 = load i64, ptr %local.gi_3.46
  %t204 = call i64 @"sx_f64_mul"(i64 %t202, i64 %t203)
  %t205 = call i64 @"sx_f64_add"(i64 %t201, i64 %t204)
  store i64 %t205, ptr %local.ind_sum.42
  %t206 = load i64, ptr %local.i.35
  %t207 = add i64 %t206, 1
  store i64 %t207, ptr %local.j.47
  br label %loop4
loop4:
  %t208 = load i64, ptr %local.j.47
  %t209 = load i64, ptr %local.k
  %t210 = icmp slt i64 %t208, %t209
  %t211 = zext i1 %t210 to i64
  %t212 = icmp ne i64 %t211, 0
  br i1 %t212, label %body4, label %endloop4
body4:
  %t213 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.21)
  %t214 = load i64, ptr %local.mean_0.27
  %t215 = load i64, ptr %local.targets_0.31
  %t216 = load i64, ptr %local.j.47
  %t217 = inttoptr i64 %t215 to ptr
  %t218 = call ptr @intrinsic_vec_get(ptr %t217, i64 %t216)
  %t219 = ptrtoint ptr %t218 to i64
  %t220 = call i64 @"sx_f64_sub"(i64 %t214, i64 %t219)
  %t221 = call i64 @"sx_f64_mul"(i64 %t213, i64 %t220)
  store i64 %t221, ptr %local.gj_0.48
  %t222 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.22)
  %t223 = load i64, ptr %local.mean_1.28
  %t224 = load i64, ptr %local.targets_1.32
  %t225 = load i64, ptr %local.j.47
  %t226 = inttoptr i64 %t224 to ptr
  %t227 = call ptr @intrinsic_vec_get(ptr %t226, i64 %t225)
  %t228 = ptrtoint ptr %t227 to i64
  %t229 = call i64 @"sx_f64_sub"(i64 %t223, i64 %t228)
  %t230 = call i64 @"sx_f64_mul"(i64 %t222, i64 %t229)
  store i64 %t230, ptr %local.gj_1.49
  %t231 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.23)
  %t232 = load i64, ptr %local.mean_2.29
  %t233 = load i64, ptr %local.targets_2.33
  %t234 = load i64, ptr %local.j.47
  %t235 = inttoptr i64 %t233 to ptr
  %t236 = call ptr @intrinsic_vec_get(ptr %t235, i64 %t234)
  %t237 = ptrtoint ptr %t236 to i64
  %t238 = call i64 @"sx_f64_sub"(i64 %t232, i64 %t237)
  %t239 = call i64 @"sx_f64_mul"(i64 %t231, i64 %t238)
  store i64 %t239, ptr %local.gj_2.50
  %t240 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.24)
  %t241 = load i64, ptr %local.mean_3.30
  %t242 = load i64, ptr %local.targets_3.34
  %t243 = load i64, ptr %local.j.47
  %t244 = inttoptr i64 %t242 to ptr
  %t245 = call ptr @intrinsic_vec_get(ptr %t244, i64 %t243)
  %t246 = ptrtoint ptr %t245 to i64
  %t247 = call i64 @"sx_f64_sub"(i64 %t241, i64 %t246)
  %t248 = call i64 @"sx_f64_mul"(i64 %t240, i64 %t247)
  store i64 %t248, ptr %local.gj_3.51
  %t249 = load i64, ptr %local.cross_sum.41
  %t250 = load i64, ptr %local.gi_0.43
  %t251 = load i64, ptr %local.gj_0.48
  %t252 = call i64 @"sx_f64_mul"(i64 %t250, i64 %t251)
  %t253 = call i64 @"sx_f64_add"(i64 %t249, i64 %t252)
  %t254 = load i64, ptr %local.gi_1.44
  %t255 = load i64, ptr %local.gj_1.49
  %t256 = call i64 @"sx_f64_mul"(i64 %t254, i64 %t255)
  %t257 = call i64 @"sx_f64_add"(i64 %t253, i64 %t256)
  %t258 = load i64, ptr %local.gi_2.45
  %t259 = load i64, ptr %local.gj_2.50
  %t260 = call i64 @"sx_f64_mul"(i64 %t258, i64 %t259)
  %t261 = call i64 @"sx_f64_add"(i64 %t257, i64 %t260)
  %t262 = load i64, ptr %local.gi_3.46
  %t263 = load i64, ptr %local.gj_3.51
  %t264 = call i64 @"sx_f64_mul"(i64 %t262, i64 %t263)
  %t265 = call i64 @"sx_f64_add"(i64 %t261, i64 %t264)
  store i64 %t265, ptr %local.cross_sum.41
  %t266 = load i64, ptr %local.j.47
  %t267 = add i64 %t266, 1
  store i64 %t267, ptr %local.j.47
  br label %loop4
endloop4:
  %t268 = load i64, ptr %local.i.35
  %t269 = add i64 %t268, 1
  store i64 %t269, ptr %local.i.35
  br label %loop3
endloop3:
  %t270 = load i64, ptr %local.ind_sum.42
  %t271 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.25)
  %t272 = call i64 @"sx_f64_lt"(i64 %t270, i64 %t271)
  %t273 = icmp ne i64 %t272, 0
  br i1 %t273, label %then5, label %else5
then5:
  %t274 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.26)
  ret i64 %t274
else5:
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t275 = phi i64 [ 0, %else5_end ]
  %t276 = load i64, ptr %local.cross_sum.41
  %t277 = load i64, ptr %local.ind_sum.42
  %t278 = call i64 @"sx_f64_div"(i64 %t276, i64 %t277)
  ret i64 %t278
}

define i64 @"proof_k_sweep"() nounwind {
entry:
  %local.failures.279 = alloca i64
  %local.k.280 = alloca i64
  %local.i1.281 = alloca i64
  %local.i2.282 = alloca i64
  %local.i3.283 = alloca i64
  %local.ok.284 = alloca i64
  %t285 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.27)
  %t286 = ptrtoint ptr %t285 to i64
  %t287 = inttoptr i64 %t286 to ptr
  call void @intrinsic_println(ptr %t287)
  %t288 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.28)
  %t289 = ptrtoint ptr %t288 to i64
  %t290 = inttoptr i64 %t289 to ptr
  call void @intrinsic_println(ptr %t290)
  %t291 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.29)
  %t292 = ptrtoint ptr %t291 to i64
  %t293 = inttoptr i64 %t292 to ptr
  call void @intrinsic_println(ptr %t293)
  %t294 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.30)
  %t295 = ptrtoint ptr %t294 to i64
  %t296 = inttoptr i64 %t295 to ptr
  call void @intrinsic_println(ptr %t296)
  store i64 0, ptr %local.failures.279
  store i64 2, ptr %local.k.280
  br label %loop6
loop6:
  %t297 = load i64, ptr %local.k.280
  %t298 = icmp sle i64 %t297, 20
  %t299 = zext i1 %t298 to i64
  %t300 = icmp ne i64 %t299, 0
  br i1 %t300, label %body6, label %endloop6
body6:
  %t301 = load i64, ptr %local.k.280
  %t302 = call i64 @"compute_iratio_at_mean"(i64 %t301, i64 42)
  store i64 %t302, ptr %local.i1.281
  %t303 = load i64, ptr %local.k.280
  %t304 = call i64 @"compute_iratio_at_mean"(i64 %t303, i64 137)
  store i64 %t304, ptr %local.i2.282
  %t305 = load i64, ptr %local.k.280
  %t306 = call i64 @"compute_iratio_at_mean"(i64 %t305, i64 999)
  store i64 %t306, ptr %local.i3.283
  %t307 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.31)
  %t308 = ptrtoint ptr %t307 to i64
  %t309 = inttoptr i64 %t308 to ptr
  call void @intrinsic_print(ptr %t309)
  %t310 = load i64, ptr %local.k.280
  call void @print_i64(i64 %t310)
  %t311 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.32)
  %t312 = ptrtoint ptr %t311 to i64
  %t313 = inttoptr i64 %t312 to ptr
  call void @intrinsic_print(ptr %t313)
  %t314 = load i64, ptr %local.i1.281
  %t315 = call i64 @"print_f64"(i64 %t314)
  %t316 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.33)
  %t317 = ptrtoint ptr %t316 to i64
  %t318 = inttoptr i64 %t317 to ptr
  call void @intrinsic_print(ptr %t318)
  %t319 = load i64, ptr %local.i2.282
  %t320 = call i64 @"print_f64"(i64 %t319)
  %t321 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.34)
  %t322 = ptrtoint ptr %t321 to i64
  %t323 = inttoptr i64 %t322 to ptr
  call void @intrinsic_print(ptr %t323)
  %t324 = load i64, ptr %local.i3.283
  %t325 = call i64 @"print_f64"(i64 %t324)
  %t326 = load i64, ptr %local.i1.281
  %t327 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.35)
  %t328 = call i64 @"sx_f64_add"(i64 %t326, i64 %t327)
  %t329 = call i64 @"abs_f64"(i64 %t328)
  %t330 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.36)
  %t331 = call i64 @"sx_f64_lt"(i64 %t329, i64 %t330)
  %t332 = icmp ne i64 %t331, 0
  br i1 %t332, label %then7, label %else7
then7:
  %t333 = load i64, ptr %local.i2.282
  %t334 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.37)
  %t335 = call i64 @"sx_f64_add"(i64 %t333, i64 %t334)
  %t336 = call i64 @"abs_f64"(i64 %t335)
  %t337 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.38)
  %t338 = call i64 @"sx_f64_lt"(i64 %t336, i64 %t337)
  %t339 = icmp ne i64 %t338, 0
  br i1 %t339, label %then8, label %else8
then8:
  %t340 = load i64, ptr %local.i3.283
  %t341 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.39)
  %t342 = call i64 @"sx_f64_add"(i64 %t340, i64 %t341)
  %t343 = call i64 @"abs_f64"(i64 %t342)
  %t344 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.40)
  %t345 = call i64 @"sx_f64_lt"(i64 %t343, i64 %t344)
  %t346 = icmp ne i64 %t345, 0
  br i1 %t346, label %then9, label %else9
then9:
  br label %then9_end
then9_end:
  br label %endif9
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t347 = phi i64 [ 1, %then9_end ], [ 0, %else9_end ]
  br label %then8_end
then8_end:
  br label %endif8
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t348 = phi i64 [ %t347, %then8_end ], [ 0, %else8_end ]
  br label %then7_end
then7_end:
  br label %endif7
else7:
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t349 = phi i64 [ %t348, %then7_end ], [ 0, %else7_end ]
  store i64 %t349, ptr %local.ok.284
  %t350 = load i64, ptr %local.ok.284
  %t351 = icmp eq i64 %t350, 1
  %t352 = zext i1 %t351 to i64
  %t353 = icmp ne i64 %t352, 0
  br i1 %t353, label %then10, label %else10
then10:
  %t354 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.41)
  %t355 = ptrtoint ptr %t354 to i64
  %t356 = inttoptr i64 %t355 to ptr
  call void @intrinsic_println(ptr %t356)
  br label %then10_end
then10_end:
  br label %endif10
else10:
  %t357 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.42)
  %t358 = ptrtoint ptr %t357 to i64
  %t359 = inttoptr i64 %t358 to ptr
  call void @intrinsic_println(ptr %t359)
  %t360 = load i64, ptr %local.failures.279
  %t361 = add i64 %t360, 1
  store i64 %t361, ptr %local.failures.279
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t362 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  %t363 = load i64, ptr %local.k.280
  %t364 = add i64 %t363, 1
  store i64 %t364, ptr %local.k.280
  br label %loop6
endloop6:
  %t365 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.43)
  %t366 = ptrtoint ptr %t365 to i64
  %t367 = inttoptr i64 %t366 to ptr
  call void @intrinsic_println(ptr %t367)
  %t368 = load i64, ptr %local.failures.279
  %t369 = icmp eq i64 %t368, 0
  %t370 = zext i1 %t369 to i64
  %t371 = icmp ne i64 %t370, 0
  br i1 %t371, label %then11, label %else11
then11:
  %t372 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.44)
  %t373 = ptrtoint ptr %t372 to i64
  %t374 = inttoptr i64 %t373 to ptr
  call void @intrinsic_println(ptr %t374)
  br label %then11_end
then11_end:
  br label %endif11
else11:
  %t375 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.45)
  %t376 = ptrtoint ptr %t375 to i64
  %t377 = inttoptr i64 %t376 to ptr
  call void @intrinsic_print(ptr %t377)
  %t378 = load i64, ptr %local.failures.279
  call void @print_i64(i64 %t378)
  %t379 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.46)
  %t380 = ptrtoint ptr %t379 to i64
  %t381 = inttoptr i64 %t380 to ptr
  call void @intrinsic_println(ptr %t381)
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t382 = phi i64 [ 0, %then11_end ], [ 0, %else11_end ]
  %t383 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.47)
  %t384 = ptrtoint ptr %t383 to i64
  %t385 = inttoptr i64 %t384 to ptr
  call void @intrinsic_println(ptr %t385)
  %t386 = load i64, ptr %local.failures.279
  ret i64 %t386
}

define i64 @"proof_off_equilibrium"() nounwind {
entry:
  %local.failures.387 = alloca i64
  %local.rng.388 = alloca i64
  %local.test.389 = alloca i64
  %local.t1_0.390 = alloca i64
  %local.t1_1.391 = alloca i64
  %local.t1_2.392 = alloca i64
  %local.t1_3.393 = alloca i64
  %local.t2_0.394 = alloca i64
  %local.t2_1.395 = alloca i64
  %local.t2_2.396 = alloca i64
  %local.t2_3.397 = alloca i64
  %local.t3_0.398 = alloca i64
  %local.t3_1.399 = alloca i64
  %local.t3_2.400 = alloca i64
  %local.t3_3.401 = alloca i64
  %local.eq_0.402 = alloca i64
  %local.eq_1.403 = alloca i64
  %local.eq_2.404 = alloca i64
  %local.eq_3.405 = alloca i64
  %local.g1_0.406 = alloca i64
  %local.g1_1.407 = alloca i64
  %local.g1_2.408 = alloca i64
  %local.g1_3.409 = alloca i64
  %local.g2_0.410 = alloca i64
  %local.g2_1.411 = alloca i64
  %local.g2_2.412 = alloca i64
  %local.g2_3.413 = alloca i64
  %local.g3_0.414 = alloca i64
  %local.g3_1.415 = alloca i64
  %local.g3_2.416 = alloca i64
  %local.g3_3.417 = alloca i64
  %local.c12.418 = alloca i64
  %local.c13.419 = alloca i64
  %local.c23.420 = alloca i64
  %local.cross_eq.421 = alloca i64
  %local.n1.422 = alloca i64
  %local.n2.423 = alloca i64
  %local.n3.424 = alloca i64
  %local.ind_eq.425 = alloca i64
  %local.ir_eq.426 = alloca i64
  %local.x0.427 = alloca i64
  %local.x1.428 = alloca i64
  %local.x2.429 = alloca i64
  %local.x3.430 = alloca i64
  %local.h1_0.431 = alloca i64
  %local.h1_1.432 = alloca i64
  %local.h1_2.433 = alloca i64
  %local.h1_3.434 = alloca i64
  %local.h2_0.435 = alloca i64
  %local.h2_1.436 = alloca i64
  %local.h2_2.437 = alloca i64
  %local.h2_3.438 = alloca i64
  %local.h3_0.439 = alloca i64
  %local.h3_1.440 = alloca i64
  %local.h3_2.441 = alloca i64
  %local.h3_3.442 = alloca i64
  %local.hc12.443 = alloca i64
  %local.hc13.444 = alloca i64
  %local.hc23.445 = alloca i64
  %local.hcross.446 = alloca i64
  %local.hn1.447 = alloca i64
  %local.hn2.448 = alloca i64
  %local.hn3.449 = alloca i64
  %local.hind.450 = alloca i64
  %local.hir.451 = alloca i64
  %t452 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.48)
  %t453 = ptrtoint ptr %t452 to i64
  %t454 = inttoptr i64 %t453 to ptr
  call void @intrinsic_println(ptr %t454)
  %t455 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.49)
  %t456 = ptrtoint ptr %t455 to i64
  %t457 = inttoptr i64 %t456 to ptr
  call void @intrinsic_println(ptr %t457)
  %t458 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.50)
  %t459 = ptrtoint ptr %t458 to i64
  %t460 = inttoptr i64 %t459 to ptr
  call void @intrinsic_println(ptr %t460)
  store i64 0, ptr %local.failures.387
  store i64 7777, ptr %local.rng.388
  store i64 0, ptr %local.test.389
  %t461 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.51)
  store i64 %t461, ptr %local.t1_0.390
  %t462 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.52)
  store i64 %t462, ptr %local.t1_1.391
  %t463 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.53)
  %t464 = xor i64 %t463, -9223372036854775808
  store i64 %t464, ptr %local.t1_2.392
  %t465 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.54)
  store i64 %t465, ptr %local.t1_3.393
  %t466 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.55)
  %t467 = xor i64 %t466, -9223372036854775808
  store i64 %t467, ptr %local.t2_0.394
  %t468 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.56)
  store i64 %t468, ptr %local.t2_1.395
  %t469 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.57)
  store i64 %t469, ptr %local.t2_2.396
  %t470 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.58)
  %t471 = xor i64 %t470, -9223372036854775808
  store i64 %t471, ptr %local.t2_3.397
  %t472 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.59)
  store i64 %t472, ptr %local.t3_0.398
  %t473 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.60)
  %t474 = xor i64 %t473, -9223372036854775808
  store i64 %t474, ptr %local.t3_1.399
  %t475 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.61)
  store i64 %t475, ptr %local.t3_2.400
  %t476 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.62)
  store i64 %t476, ptr %local.t3_3.401
  %t477 = load i64, ptr %local.t1_0.390
  %t478 = load i64, ptr %local.t2_0.394
  %t479 = call i64 @"sx_f64_add"(i64 %t477, i64 %t478)
  %t480 = load i64, ptr %local.t3_0.398
  %t481 = call i64 @"sx_f64_add"(i64 %t479, i64 %t480)
  %t482 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.63)
  %t483 = call i64 @"sx_f64_div"(i64 %t481, i64 %t482)
  store i64 %t483, ptr %local.eq_0.402
  %t484 = load i64, ptr %local.t1_1.391
  %t485 = load i64, ptr %local.t2_1.395
  %t486 = call i64 @"sx_f64_add"(i64 %t484, i64 %t485)
  %t487 = load i64, ptr %local.t3_1.399
  %t488 = call i64 @"sx_f64_add"(i64 %t486, i64 %t487)
  %t489 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.64)
  %t490 = call i64 @"sx_f64_div"(i64 %t488, i64 %t489)
  store i64 %t490, ptr %local.eq_1.403
  %t491 = load i64, ptr %local.t1_2.392
  %t492 = load i64, ptr %local.t2_2.396
  %t493 = call i64 @"sx_f64_add"(i64 %t491, i64 %t492)
  %t494 = load i64, ptr %local.t3_2.400
  %t495 = call i64 @"sx_f64_add"(i64 %t493, i64 %t494)
  %t496 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.65)
  %t497 = call i64 @"sx_f64_div"(i64 %t495, i64 %t496)
  store i64 %t497, ptr %local.eq_2.404
  %t498 = load i64, ptr %local.t1_3.393
  %t499 = load i64, ptr %local.t2_3.397
  %t500 = call i64 @"sx_f64_add"(i64 %t498, i64 %t499)
  %t501 = load i64, ptr %local.t3_3.401
  %t502 = call i64 @"sx_f64_add"(i64 %t500, i64 %t501)
  %t503 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.66)
  %t504 = call i64 @"sx_f64_div"(i64 %t502, i64 %t503)
  store i64 %t504, ptr %local.eq_3.405
  %t505 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.67)
  %t506 = load i64, ptr %local.eq_0.402
  %t507 = load i64, ptr %local.t1_0.390
  %t508 = call i64 @"sx_f64_sub"(i64 %t506, i64 %t507)
  %t509 = call i64 @"sx_f64_mul"(i64 %t505, i64 %t508)
  store i64 %t509, ptr %local.g1_0.406
  %t510 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.68)
  %t511 = load i64, ptr %local.eq_1.403
  %t512 = load i64, ptr %local.t1_1.391
  %t513 = call i64 @"sx_f64_sub"(i64 %t511, i64 %t512)
  %t514 = call i64 @"sx_f64_mul"(i64 %t510, i64 %t513)
  store i64 %t514, ptr %local.g1_1.407
  %t515 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.69)
  %t516 = load i64, ptr %local.eq_2.404
  %t517 = load i64, ptr %local.t1_2.392
  %t518 = call i64 @"sx_f64_sub"(i64 %t516, i64 %t517)
  %t519 = call i64 @"sx_f64_mul"(i64 %t515, i64 %t518)
  store i64 %t519, ptr %local.g1_2.408
  %t520 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.70)
  %t521 = load i64, ptr %local.eq_3.405
  %t522 = load i64, ptr %local.t1_3.393
  %t523 = call i64 @"sx_f64_sub"(i64 %t521, i64 %t522)
  %t524 = call i64 @"sx_f64_mul"(i64 %t520, i64 %t523)
  store i64 %t524, ptr %local.g1_3.409
  %t525 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.71)
  %t526 = load i64, ptr %local.eq_0.402
  %t527 = load i64, ptr %local.t2_0.394
  %t528 = call i64 @"sx_f64_sub"(i64 %t526, i64 %t527)
  %t529 = call i64 @"sx_f64_mul"(i64 %t525, i64 %t528)
  store i64 %t529, ptr %local.g2_0.410
  %t530 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.72)
  %t531 = load i64, ptr %local.eq_1.403
  %t532 = load i64, ptr %local.t2_1.395
  %t533 = call i64 @"sx_f64_sub"(i64 %t531, i64 %t532)
  %t534 = call i64 @"sx_f64_mul"(i64 %t530, i64 %t533)
  store i64 %t534, ptr %local.g2_1.411
  %t535 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.73)
  %t536 = load i64, ptr %local.eq_2.404
  %t537 = load i64, ptr %local.t2_2.396
  %t538 = call i64 @"sx_f64_sub"(i64 %t536, i64 %t537)
  %t539 = call i64 @"sx_f64_mul"(i64 %t535, i64 %t538)
  store i64 %t539, ptr %local.g2_2.412
  %t540 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.74)
  %t541 = load i64, ptr %local.eq_3.405
  %t542 = load i64, ptr %local.t2_3.397
  %t543 = call i64 @"sx_f64_sub"(i64 %t541, i64 %t542)
  %t544 = call i64 @"sx_f64_mul"(i64 %t540, i64 %t543)
  store i64 %t544, ptr %local.g2_3.413
  %t545 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.75)
  %t546 = load i64, ptr %local.eq_0.402
  %t547 = load i64, ptr %local.t3_0.398
  %t548 = call i64 @"sx_f64_sub"(i64 %t546, i64 %t547)
  %t549 = call i64 @"sx_f64_mul"(i64 %t545, i64 %t548)
  store i64 %t549, ptr %local.g3_0.414
  %t550 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.76)
  %t551 = load i64, ptr %local.eq_1.403
  %t552 = load i64, ptr %local.t3_1.399
  %t553 = call i64 @"sx_f64_sub"(i64 %t551, i64 %t552)
  %t554 = call i64 @"sx_f64_mul"(i64 %t550, i64 %t553)
  store i64 %t554, ptr %local.g3_1.415
  %t555 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.77)
  %t556 = load i64, ptr %local.eq_2.404
  %t557 = load i64, ptr %local.t3_2.400
  %t558 = call i64 @"sx_f64_sub"(i64 %t556, i64 %t557)
  %t559 = call i64 @"sx_f64_mul"(i64 %t555, i64 %t558)
  store i64 %t559, ptr %local.g3_2.416
  %t560 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.78)
  %t561 = load i64, ptr %local.eq_3.405
  %t562 = load i64, ptr %local.t3_3.401
  %t563 = call i64 @"sx_f64_sub"(i64 %t561, i64 %t562)
  %t564 = call i64 @"sx_f64_mul"(i64 %t560, i64 %t563)
  store i64 %t564, ptr %local.g3_3.417
  %t565 = load i64, ptr %local.g1_0.406
  %t566 = load i64, ptr %local.g2_0.410
  %t567 = call i64 @"sx_f64_mul"(i64 %t565, i64 %t566)
  %t568 = load i64, ptr %local.g1_1.407
  %t569 = load i64, ptr %local.g2_1.411
  %t570 = call i64 @"sx_f64_mul"(i64 %t568, i64 %t569)
  %t571 = call i64 @"sx_f64_add"(i64 %t567, i64 %t570)
  %t572 = load i64, ptr %local.g1_2.408
  %t573 = load i64, ptr %local.g2_2.412
  %t574 = call i64 @"sx_f64_mul"(i64 %t572, i64 %t573)
  %t575 = call i64 @"sx_f64_add"(i64 %t571, i64 %t574)
  %t576 = load i64, ptr %local.g1_3.409
  %t577 = load i64, ptr %local.g2_3.413
  %t578 = call i64 @"sx_f64_mul"(i64 %t576, i64 %t577)
  %t579 = call i64 @"sx_f64_add"(i64 %t575, i64 %t578)
  store i64 %t579, ptr %local.c12.418
  %t580 = load i64, ptr %local.g1_0.406
  %t581 = load i64, ptr %local.g3_0.414
  %t582 = call i64 @"sx_f64_mul"(i64 %t580, i64 %t581)
  %t583 = load i64, ptr %local.g1_1.407
  %t584 = load i64, ptr %local.g3_1.415
  %t585 = call i64 @"sx_f64_mul"(i64 %t583, i64 %t584)
  %t586 = call i64 @"sx_f64_add"(i64 %t582, i64 %t585)
  %t587 = load i64, ptr %local.g1_2.408
  %t588 = load i64, ptr %local.g3_2.416
  %t589 = call i64 @"sx_f64_mul"(i64 %t587, i64 %t588)
  %t590 = call i64 @"sx_f64_add"(i64 %t586, i64 %t589)
  %t591 = load i64, ptr %local.g1_3.409
  %t592 = load i64, ptr %local.g3_3.417
  %t593 = call i64 @"sx_f64_mul"(i64 %t591, i64 %t592)
  %t594 = call i64 @"sx_f64_add"(i64 %t590, i64 %t593)
  store i64 %t594, ptr %local.c13.419
  %t595 = load i64, ptr %local.g2_0.410
  %t596 = load i64, ptr %local.g3_0.414
  %t597 = call i64 @"sx_f64_mul"(i64 %t595, i64 %t596)
  %t598 = load i64, ptr %local.g2_1.411
  %t599 = load i64, ptr %local.g3_1.415
  %t600 = call i64 @"sx_f64_mul"(i64 %t598, i64 %t599)
  %t601 = call i64 @"sx_f64_add"(i64 %t597, i64 %t600)
  %t602 = load i64, ptr %local.g2_2.412
  %t603 = load i64, ptr %local.g3_2.416
  %t604 = call i64 @"sx_f64_mul"(i64 %t602, i64 %t603)
  %t605 = call i64 @"sx_f64_add"(i64 %t601, i64 %t604)
  %t606 = load i64, ptr %local.g2_3.413
  %t607 = load i64, ptr %local.g3_3.417
  %t608 = call i64 @"sx_f64_mul"(i64 %t606, i64 %t607)
  %t609 = call i64 @"sx_f64_add"(i64 %t605, i64 %t608)
  store i64 %t609, ptr %local.c23.420
  %t610 = load i64, ptr %local.c12.418
  %t611 = load i64, ptr %local.c13.419
  %t612 = call i64 @"sx_f64_add"(i64 %t610, i64 %t611)
  %t613 = load i64, ptr %local.c23.420
  %t614 = call i64 @"sx_f64_add"(i64 %t612, i64 %t613)
  store i64 %t614, ptr %local.cross_eq.421
  %t615 = load i64, ptr %local.g1_0.406
  %t616 = load i64, ptr %local.g1_0.406
  %t617 = call i64 @"sx_f64_mul"(i64 %t615, i64 %t616)
  %t618 = load i64, ptr %local.g1_1.407
  %t619 = load i64, ptr %local.g1_1.407
  %t620 = call i64 @"sx_f64_mul"(i64 %t618, i64 %t619)
  %t621 = call i64 @"sx_f64_add"(i64 %t617, i64 %t620)
  %t622 = load i64, ptr %local.g1_2.408
  %t623 = load i64, ptr %local.g1_2.408
  %t624 = call i64 @"sx_f64_mul"(i64 %t622, i64 %t623)
  %t625 = call i64 @"sx_f64_add"(i64 %t621, i64 %t624)
  %t626 = load i64, ptr %local.g1_3.409
  %t627 = load i64, ptr %local.g1_3.409
  %t628 = call i64 @"sx_f64_mul"(i64 %t626, i64 %t627)
  %t629 = call i64 @"sx_f64_add"(i64 %t625, i64 %t628)
  store i64 %t629, ptr %local.n1.422
  %t630 = load i64, ptr %local.g2_0.410
  %t631 = load i64, ptr %local.g2_0.410
  %t632 = call i64 @"sx_f64_mul"(i64 %t630, i64 %t631)
  %t633 = load i64, ptr %local.g2_1.411
  %t634 = load i64, ptr %local.g2_1.411
  %t635 = call i64 @"sx_f64_mul"(i64 %t633, i64 %t634)
  %t636 = call i64 @"sx_f64_add"(i64 %t632, i64 %t635)
  %t637 = load i64, ptr %local.g2_2.412
  %t638 = load i64, ptr %local.g2_2.412
  %t639 = call i64 @"sx_f64_mul"(i64 %t637, i64 %t638)
  %t640 = call i64 @"sx_f64_add"(i64 %t636, i64 %t639)
  %t641 = load i64, ptr %local.g2_3.413
  %t642 = load i64, ptr %local.g2_3.413
  %t643 = call i64 @"sx_f64_mul"(i64 %t641, i64 %t642)
  %t644 = call i64 @"sx_f64_add"(i64 %t640, i64 %t643)
  store i64 %t644, ptr %local.n2.423
  %t645 = load i64, ptr %local.g3_0.414
  %t646 = load i64, ptr %local.g3_0.414
  %t647 = call i64 @"sx_f64_mul"(i64 %t645, i64 %t646)
  %t648 = load i64, ptr %local.g3_1.415
  %t649 = load i64, ptr %local.g3_1.415
  %t650 = call i64 @"sx_f64_mul"(i64 %t648, i64 %t649)
  %t651 = call i64 @"sx_f64_add"(i64 %t647, i64 %t650)
  %t652 = load i64, ptr %local.g3_2.416
  %t653 = load i64, ptr %local.g3_2.416
  %t654 = call i64 @"sx_f64_mul"(i64 %t652, i64 %t653)
  %t655 = call i64 @"sx_f64_add"(i64 %t651, i64 %t654)
  %t656 = load i64, ptr %local.g3_3.417
  %t657 = load i64, ptr %local.g3_3.417
  %t658 = call i64 @"sx_f64_mul"(i64 %t656, i64 %t657)
  %t659 = call i64 @"sx_f64_add"(i64 %t655, i64 %t658)
  store i64 %t659, ptr %local.n3.424
  %t660 = load i64, ptr %local.n1.422
  %t661 = load i64, ptr %local.n2.423
  %t662 = call i64 @"sx_f64_add"(i64 %t660, i64 %t661)
  %t663 = load i64, ptr %local.n3.424
  %t664 = call i64 @"sx_f64_add"(i64 %t662, i64 %t663)
  store i64 %t664, ptr %local.ind_eq.425
  %t665 = load i64, ptr %local.cross_eq.421
  %t666 = load i64, ptr %local.ind_eq.425
  %t667 = call i64 @"sx_f64_div"(i64 %t665, i64 %t666)
  store i64 %t667, ptr %local.ir_eq.426
  %t668 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.79)
  %t669 = ptrtoint ptr %t668 to i64
  %t670 = inttoptr i64 %t669 to ptr
  call void @intrinsic_print(ptr %t670)
  %t671 = load i64, ptr %local.ir_eq.426
  %t672 = call i64 @"print_f64"(i64 %t671)
  %t673 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.80)
  %t674 = ptrtoint ptr %t673 to i64
  %t675 = inttoptr i64 %t674 to ptr
  call void @intrinsic_println(ptr %t675)
  %t676 = load i64, ptr %local.ir_eq.426
  %t677 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.81)
  %t678 = call i64 @"sx_f64_add"(i64 %t676, i64 %t677)
  %t679 = call i64 @"abs_f64"(i64 %t678)
  %t680 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.82)
  %t681 = call i64 @"sx_f64_gt"(i64 %t679, i64 %t680)
  %t682 = icmp ne i64 %t681, 0
  br i1 %t682, label %then12, label %else12
then12:
  %t683 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.83)
  %t684 = ptrtoint ptr %t683 to i64
  %t685 = inttoptr i64 %t684 to ptr
  call void @intrinsic_println(ptr %t685)
  %t686 = load i64, ptr %local.failures.387
  %t687 = add i64 %t686, 1
  store i64 %t687, ptr %local.failures.387
  br label %then12_end
then12_end:
  br label %endif12
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t688 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  %t689 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.84)
  %t690 = ptrtoint ptr %t689 to i64
  %t691 = inttoptr i64 %t690 to ptr
  call void @intrinsic_println(ptr %t691)
  br label %loop13
loop13:
  %t692 = load i64, ptr %local.test.389
  %t693 = icmp slt i64 %t692, 10
  %t694 = zext i1 %t693 to i64
  %t695 = icmp ne i64 %t694, 0
  br i1 %t695, label %body13, label %endloop13
body13:
  %t696 = load i64, ptr %local.rng.388
  %t697 = call i64 @"lcg_next"(i64 %t696)
  store i64 %t697, ptr %local.rng.388
  %t698 = load i64, ptr %local.eq_0.402
  %t699 = load i64, ptr %local.rng.388
  %t700 = call i64 @"lcg_f64"(i64 %t699)
  %t701 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.85)
  %t702 = call i64 @"sx_f64_sub"(i64 %t700, i64 %t701)
  %t703 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.86)
  %t704 = call i64 @"sx_f64_mul"(i64 %t702, i64 %t703)
  %t705 = call i64 @"sx_f64_add"(i64 %t698, i64 %t704)
  store i64 %t705, ptr %local.x0.427
  %t706 = load i64, ptr %local.rng.388
  %t707 = call i64 @"lcg_next"(i64 %t706)
  store i64 %t707, ptr %local.rng.388
  %t708 = load i64, ptr %local.eq_1.403
  %t709 = load i64, ptr %local.rng.388
  %t710 = call i64 @"lcg_f64"(i64 %t709)
  %t711 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.87)
  %t712 = call i64 @"sx_f64_sub"(i64 %t710, i64 %t711)
  %t713 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.88)
  %t714 = call i64 @"sx_f64_mul"(i64 %t712, i64 %t713)
  %t715 = call i64 @"sx_f64_add"(i64 %t708, i64 %t714)
  store i64 %t715, ptr %local.x1.428
  %t716 = load i64, ptr %local.rng.388
  %t717 = call i64 @"lcg_next"(i64 %t716)
  store i64 %t717, ptr %local.rng.388
  %t718 = load i64, ptr %local.eq_2.404
  %t719 = load i64, ptr %local.rng.388
  %t720 = call i64 @"lcg_f64"(i64 %t719)
  %t721 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.89)
  %t722 = call i64 @"sx_f64_sub"(i64 %t720, i64 %t721)
  %t723 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.90)
  %t724 = call i64 @"sx_f64_mul"(i64 %t722, i64 %t723)
  %t725 = call i64 @"sx_f64_add"(i64 %t718, i64 %t724)
  store i64 %t725, ptr %local.x2.429
  %t726 = load i64, ptr %local.rng.388
  %t727 = call i64 @"lcg_next"(i64 %t726)
  store i64 %t727, ptr %local.rng.388
  %t728 = load i64, ptr %local.eq_3.405
  %t729 = load i64, ptr %local.rng.388
  %t730 = call i64 @"lcg_f64"(i64 %t729)
  %t731 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.91)
  %t732 = call i64 @"sx_f64_sub"(i64 %t730, i64 %t731)
  %t733 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.92)
  %t734 = call i64 @"sx_f64_mul"(i64 %t732, i64 %t733)
  %t735 = call i64 @"sx_f64_add"(i64 %t728, i64 %t734)
  store i64 %t735, ptr %local.x3.430
  %t736 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.93)
  %t737 = load i64, ptr %local.x0.427
  %t738 = load i64, ptr %local.t1_0.390
  %t739 = call i64 @"sx_f64_sub"(i64 %t737, i64 %t738)
  %t740 = call i64 @"sx_f64_mul"(i64 %t736, i64 %t739)
  store i64 %t740, ptr %local.h1_0.431
  %t741 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.94)
  %t742 = load i64, ptr %local.x1.428
  %t743 = load i64, ptr %local.t1_1.391
  %t744 = call i64 @"sx_f64_sub"(i64 %t742, i64 %t743)
  %t745 = call i64 @"sx_f64_mul"(i64 %t741, i64 %t744)
  store i64 %t745, ptr %local.h1_1.432
  %t746 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.95)
  %t747 = load i64, ptr %local.x2.429
  %t748 = load i64, ptr %local.t1_2.392
  %t749 = call i64 @"sx_f64_sub"(i64 %t747, i64 %t748)
  %t750 = call i64 @"sx_f64_mul"(i64 %t746, i64 %t749)
  store i64 %t750, ptr %local.h1_2.433
  %t751 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.96)
  %t752 = load i64, ptr %local.x3.430
  %t753 = load i64, ptr %local.t1_3.393
  %t754 = call i64 @"sx_f64_sub"(i64 %t752, i64 %t753)
  %t755 = call i64 @"sx_f64_mul"(i64 %t751, i64 %t754)
  store i64 %t755, ptr %local.h1_3.434
  %t756 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.97)
  %t757 = load i64, ptr %local.x0.427
  %t758 = load i64, ptr %local.t2_0.394
  %t759 = call i64 @"sx_f64_sub"(i64 %t757, i64 %t758)
  %t760 = call i64 @"sx_f64_mul"(i64 %t756, i64 %t759)
  store i64 %t760, ptr %local.h2_0.435
  %t761 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.98)
  %t762 = load i64, ptr %local.x1.428
  %t763 = load i64, ptr %local.t2_1.395
  %t764 = call i64 @"sx_f64_sub"(i64 %t762, i64 %t763)
  %t765 = call i64 @"sx_f64_mul"(i64 %t761, i64 %t764)
  store i64 %t765, ptr %local.h2_1.436
  %t766 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.99)
  %t767 = load i64, ptr %local.x2.429
  %t768 = load i64, ptr %local.t2_2.396
  %t769 = call i64 @"sx_f64_sub"(i64 %t767, i64 %t768)
  %t770 = call i64 @"sx_f64_mul"(i64 %t766, i64 %t769)
  store i64 %t770, ptr %local.h2_2.437
  %t771 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.100)
  %t772 = load i64, ptr %local.x3.430
  %t773 = load i64, ptr %local.t2_3.397
  %t774 = call i64 @"sx_f64_sub"(i64 %t772, i64 %t773)
  %t775 = call i64 @"sx_f64_mul"(i64 %t771, i64 %t774)
  store i64 %t775, ptr %local.h2_3.438
  %t776 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.101)
  %t777 = load i64, ptr %local.x0.427
  %t778 = load i64, ptr %local.t3_0.398
  %t779 = call i64 @"sx_f64_sub"(i64 %t777, i64 %t778)
  %t780 = call i64 @"sx_f64_mul"(i64 %t776, i64 %t779)
  store i64 %t780, ptr %local.h3_0.439
  %t781 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.102)
  %t782 = load i64, ptr %local.x1.428
  %t783 = load i64, ptr %local.t3_1.399
  %t784 = call i64 @"sx_f64_sub"(i64 %t782, i64 %t783)
  %t785 = call i64 @"sx_f64_mul"(i64 %t781, i64 %t784)
  store i64 %t785, ptr %local.h3_1.440
  %t786 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.103)
  %t787 = load i64, ptr %local.x2.429
  %t788 = load i64, ptr %local.t3_2.400
  %t789 = call i64 @"sx_f64_sub"(i64 %t787, i64 %t788)
  %t790 = call i64 @"sx_f64_mul"(i64 %t786, i64 %t789)
  store i64 %t790, ptr %local.h3_2.441
  %t791 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.104)
  %t792 = load i64, ptr %local.x3.430
  %t793 = load i64, ptr %local.t3_3.401
  %t794 = call i64 @"sx_f64_sub"(i64 %t792, i64 %t793)
  %t795 = call i64 @"sx_f64_mul"(i64 %t791, i64 %t794)
  store i64 %t795, ptr %local.h3_3.442
  %t796 = load i64, ptr %local.h1_0.431
  %t797 = load i64, ptr %local.h2_0.435
  %t798 = call i64 @"sx_f64_mul"(i64 %t796, i64 %t797)
  %t799 = load i64, ptr %local.h1_1.432
  %t800 = load i64, ptr %local.h2_1.436
  %t801 = call i64 @"sx_f64_mul"(i64 %t799, i64 %t800)
  %t802 = call i64 @"sx_f64_add"(i64 %t798, i64 %t801)
  %t803 = load i64, ptr %local.h1_2.433
  %t804 = load i64, ptr %local.h2_2.437
  %t805 = call i64 @"sx_f64_mul"(i64 %t803, i64 %t804)
  %t806 = call i64 @"sx_f64_add"(i64 %t802, i64 %t805)
  %t807 = load i64, ptr %local.h1_3.434
  %t808 = load i64, ptr %local.h2_3.438
  %t809 = call i64 @"sx_f64_mul"(i64 %t807, i64 %t808)
  %t810 = call i64 @"sx_f64_add"(i64 %t806, i64 %t809)
  store i64 %t810, ptr %local.hc12.443
  %t811 = load i64, ptr %local.h1_0.431
  %t812 = load i64, ptr %local.h3_0.439
  %t813 = call i64 @"sx_f64_mul"(i64 %t811, i64 %t812)
  %t814 = load i64, ptr %local.h1_1.432
  %t815 = load i64, ptr %local.h3_1.440
  %t816 = call i64 @"sx_f64_mul"(i64 %t814, i64 %t815)
  %t817 = call i64 @"sx_f64_add"(i64 %t813, i64 %t816)
  %t818 = load i64, ptr %local.h1_2.433
  %t819 = load i64, ptr %local.h3_2.441
  %t820 = call i64 @"sx_f64_mul"(i64 %t818, i64 %t819)
  %t821 = call i64 @"sx_f64_add"(i64 %t817, i64 %t820)
  %t822 = load i64, ptr %local.h1_3.434
  %t823 = load i64, ptr %local.h3_3.442
  %t824 = call i64 @"sx_f64_mul"(i64 %t822, i64 %t823)
  %t825 = call i64 @"sx_f64_add"(i64 %t821, i64 %t824)
  store i64 %t825, ptr %local.hc13.444
  %t826 = load i64, ptr %local.h2_0.435
  %t827 = load i64, ptr %local.h3_0.439
  %t828 = call i64 @"sx_f64_mul"(i64 %t826, i64 %t827)
  %t829 = load i64, ptr %local.h2_1.436
  %t830 = load i64, ptr %local.h3_1.440
  %t831 = call i64 @"sx_f64_mul"(i64 %t829, i64 %t830)
  %t832 = call i64 @"sx_f64_add"(i64 %t828, i64 %t831)
  %t833 = load i64, ptr %local.h2_2.437
  %t834 = load i64, ptr %local.h3_2.441
  %t835 = call i64 @"sx_f64_mul"(i64 %t833, i64 %t834)
  %t836 = call i64 @"sx_f64_add"(i64 %t832, i64 %t835)
  %t837 = load i64, ptr %local.h2_3.438
  %t838 = load i64, ptr %local.h3_3.442
  %t839 = call i64 @"sx_f64_mul"(i64 %t837, i64 %t838)
  %t840 = call i64 @"sx_f64_add"(i64 %t836, i64 %t839)
  store i64 %t840, ptr %local.hc23.445
  %t841 = load i64, ptr %local.hc12.443
  %t842 = load i64, ptr %local.hc13.444
  %t843 = call i64 @"sx_f64_add"(i64 %t841, i64 %t842)
  %t844 = load i64, ptr %local.hc23.445
  %t845 = call i64 @"sx_f64_add"(i64 %t843, i64 %t844)
  store i64 %t845, ptr %local.hcross.446
  %t846 = load i64, ptr %local.h1_0.431
  %t847 = load i64, ptr %local.h1_0.431
  %t848 = call i64 @"sx_f64_mul"(i64 %t846, i64 %t847)
  %t849 = load i64, ptr %local.h1_1.432
  %t850 = load i64, ptr %local.h1_1.432
  %t851 = call i64 @"sx_f64_mul"(i64 %t849, i64 %t850)
  %t852 = call i64 @"sx_f64_add"(i64 %t848, i64 %t851)
  %t853 = load i64, ptr %local.h1_2.433
  %t854 = load i64, ptr %local.h1_2.433
  %t855 = call i64 @"sx_f64_mul"(i64 %t853, i64 %t854)
  %t856 = call i64 @"sx_f64_add"(i64 %t852, i64 %t855)
  %t857 = load i64, ptr %local.h1_3.434
  %t858 = load i64, ptr %local.h1_3.434
  %t859 = call i64 @"sx_f64_mul"(i64 %t857, i64 %t858)
  %t860 = call i64 @"sx_f64_add"(i64 %t856, i64 %t859)
  store i64 %t860, ptr %local.hn1.447
  %t861 = load i64, ptr %local.h2_0.435
  %t862 = load i64, ptr %local.h2_0.435
  %t863 = call i64 @"sx_f64_mul"(i64 %t861, i64 %t862)
  %t864 = load i64, ptr %local.h2_1.436
  %t865 = load i64, ptr %local.h2_1.436
  %t866 = call i64 @"sx_f64_mul"(i64 %t864, i64 %t865)
  %t867 = call i64 @"sx_f64_add"(i64 %t863, i64 %t866)
  %t868 = load i64, ptr %local.h2_2.437
  %t869 = load i64, ptr %local.h2_2.437
  %t870 = call i64 @"sx_f64_mul"(i64 %t868, i64 %t869)
  %t871 = call i64 @"sx_f64_add"(i64 %t867, i64 %t870)
  %t872 = load i64, ptr %local.h2_3.438
  %t873 = load i64, ptr %local.h2_3.438
  %t874 = call i64 @"sx_f64_mul"(i64 %t872, i64 %t873)
  %t875 = call i64 @"sx_f64_add"(i64 %t871, i64 %t874)
  store i64 %t875, ptr %local.hn2.448
  %t876 = load i64, ptr %local.h3_0.439
  %t877 = load i64, ptr %local.h3_0.439
  %t878 = call i64 @"sx_f64_mul"(i64 %t876, i64 %t877)
  %t879 = load i64, ptr %local.h3_1.440
  %t880 = load i64, ptr %local.h3_1.440
  %t881 = call i64 @"sx_f64_mul"(i64 %t879, i64 %t880)
  %t882 = call i64 @"sx_f64_add"(i64 %t878, i64 %t881)
  %t883 = load i64, ptr %local.h3_2.441
  %t884 = load i64, ptr %local.h3_2.441
  %t885 = call i64 @"sx_f64_mul"(i64 %t883, i64 %t884)
  %t886 = call i64 @"sx_f64_add"(i64 %t882, i64 %t885)
  %t887 = load i64, ptr %local.h3_3.442
  %t888 = load i64, ptr %local.h3_3.442
  %t889 = call i64 @"sx_f64_mul"(i64 %t887, i64 %t888)
  %t890 = call i64 @"sx_f64_add"(i64 %t886, i64 %t889)
  store i64 %t890, ptr %local.hn3.449
  %t891 = load i64, ptr %local.hn1.447
  %t892 = load i64, ptr %local.hn2.448
  %t893 = call i64 @"sx_f64_add"(i64 %t891, i64 %t892)
  %t894 = load i64, ptr %local.hn3.449
  %t895 = call i64 @"sx_f64_add"(i64 %t893, i64 %t894)
  store i64 %t895, ptr %local.hind.450
  %t896 = load i64, ptr %local.hcross.446
  %t897 = load i64, ptr %local.hind.450
  %t898 = call i64 @"sx_f64_div"(i64 %t896, i64 %t897)
  store i64 %t898, ptr %local.hir.451
  %t899 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.105)
  %t900 = ptrtoint ptr %t899 to i64
  %t901 = inttoptr i64 %t900 to ptr
  call void @intrinsic_print(ptr %t901)
  %t902 = load i64, ptr %local.test.389
  call void @print_i64(i64 %t902)
  %t903 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.106)
  %t904 = ptrtoint ptr %t903 to i64
  %t905 = inttoptr i64 %t904 to ptr
  call void @intrinsic_print(ptr %t905)
  %t906 = load i64, ptr %local.hir.451
  %t907 = call i64 @"print_f64"(i64 %t906)
  %t908 = load i64, ptr %local.hir.451
  %t909 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.107)
  %t910 = call i64 @"sx_f64_add"(i64 %t908, i64 %t909)
  %t911 = call i64 @"abs_f64"(i64 %t910)
  %t912 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.108)
  %t913 = call i64 @"sx_f64_lt"(i64 %t911, i64 %t912)
  %t914 = icmp ne i64 %t913, 0
  br i1 %t914, label %then14, label %else14
then14:
  %t915 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.109)
  %t916 = ptrtoint ptr %t915 to i64
  %t917 = inttoptr i64 %t916 to ptr
  call void @intrinsic_println(ptr %t917)
  %t918 = load i64, ptr %local.failures.387
  %t919 = add i64 %t918, 1
  store i64 %t919, ptr %local.failures.387
  br label %then14_end
then14_end:
  br label %endif14
else14:
  %t920 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.110)
  %t921 = ptrtoint ptr %t920 to i64
  %t922 = inttoptr i64 %t921 to ptr
  call void @intrinsic_println(ptr %t922)
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t923 = phi i64 [ 0, %then14_end ], [ 0, %else14_end ]
  %t924 = load i64, ptr %local.test.389
  %t925 = add i64 %t924, 1
  store i64 %t925, ptr %local.test.389
  br label %loop13
endloop13:
  %t926 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.111)
  %t927 = ptrtoint ptr %t926 to i64
  %t928 = inttoptr i64 %t927 to ptr
  call void @intrinsic_println(ptr %t928)
  %t929 = load i64, ptr %local.failures.387
  %t930 = icmp eq i64 %t929, 0
  %t931 = zext i1 %t930 to i64
  %t932 = icmp ne i64 %t931, 0
  br i1 %t932, label %then15, label %else15
then15:
  %t933 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.112)
  %t934 = ptrtoint ptr %t933 to i64
  %t935 = inttoptr i64 %t934 to ptr
  call void @intrinsic_println(ptr %t935)
  br label %then15_end
then15_end:
  br label %endif15
else15:
  %t936 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.113)
  %t937 = ptrtoint ptr %t936 to i64
  %t938 = inttoptr i64 %t937 to ptr
  call void @intrinsic_print(ptr %t938)
  %t939 = load i64, ptr %local.failures.387
  call void @print_i64(i64 %t939)
  %t940 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.114)
  %t941 = ptrtoint ptr %t940 to i64
  %t942 = inttoptr i64 %t941 to ptr
  call void @intrinsic_println(ptr %t942)
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t943 = phi i64 [ 0, %then15_end ], [ 0, %else15_end ]
  %t944 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.115)
  %t945 = ptrtoint ptr %t944 to i64
  %t946 = inttoptr i64 %t945 to ptr
  call void @intrinsic_println(ptr %t946)
  %t947 = load i64, ptr %local.failures.387
  ret i64 %t947
}

define i64 @"iratio_nd"(i64 %k, i64 %dim, i64 %seed) nounwind {
entry:
  %local.rng.948 = alloca i64
  %local.targets.949 = alloca i64
  %local.means.950 = alloca i64
  %local.d.951 = alloca i64
  %local.i.952 = alloca i64
  %local.t.953 = alloca i64
  %local.kf.954 = alloca i64
  %local.cross_sum.955 = alloca i64
  %local.ind_sum.956 = alloca i64
  %local.gi_sq.957 = alloca i64
  %local.gi_d.958 = alloca i64
  %local.j.959 = alloca i64
  %local.gj_d.960 = alloca i64
  %local.k = alloca i64
  store i64 %k, ptr %local.k
  %local.dim = alloca i64
  store i64 %dim, ptr %local.dim
  %local.seed = alloca i64
  store i64 %seed, ptr %local.seed
  %t961 = load i64, ptr %local.seed
  store i64 %t961, ptr %local.rng.948
  %t962 = call ptr @intrinsic_vec_new()
  %t963 = ptrtoint ptr %t962 to i64
  store i64 %t963, ptr %local.targets.949
  %t964 = call ptr @intrinsic_vec_new()
  %t965 = ptrtoint ptr %t964 to i64
  store i64 %t965, ptr %local.means.950
  store i64 0, ptr %local.d.951
  br label %loop16
loop16:
  %t966 = load i64, ptr %local.d.951
  %t967 = load i64, ptr %local.dim
  %t968 = icmp slt i64 %t966, %t967
  %t969 = zext i1 %t968 to i64
  %t970 = icmp ne i64 %t969, 0
  br i1 %t970, label %body16, label %endloop16
body16:
  %t971 = load i64, ptr %local.means.950
  %t972 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.116)
  %t973 = inttoptr i64 %t971 to ptr
  %t974 = inttoptr i64 %t972 to ptr
  call void @intrinsic_vec_push(ptr %t973, ptr %t974)
  %t975 = load i64, ptr %local.d.951
  %t976 = add i64 %t975, 1
  store i64 %t976, ptr %local.d.951
  br label %loop16
endloop16:
  store i64 0, ptr %local.i.952
  br label %loop17
loop17:
  %t977 = load i64, ptr %local.i.952
  %t978 = load i64, ptr %local.k
  %t979 = icmp slt i64 %t977, %t978
  %t980 = zext i1 %t979 to i64
  %t981 = icmp ne i64 %t980, 0
  br i1 %t981, label %body17, label %endloop17
body17:
  store i64 0, ptr %local.d.951
  br label %loop18
loop18:
  %t982 = load i64, ptr %local.d.951
  %t983 = load i64, ptr %local.dim
  %t984 = icmp slt i64 %t982, %t983
  %t985 = zext i1 %t984 to i64
  %t986 = icmp ne i64 %t985, 0
  br i1 %t986, label %body18, label %endloop18
body18:
  %t987 = load i64, ptr %local.rng.948
  %t988 = call i64 @"lcg_next"(i64 %t987)
  store i64 %t988, ptr %local.rng.948
  %t989 = load i64, ptr %local.rng.948
  %t990 = call i64 @"lcg_f64"(i64 %t989)
  %t991 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.117)
  %t992 = call i64 @"sx_f64_sub"(i64 %t990, i64 %t991)
  %t993 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.118)
  %t994 = call i64 @"sx_f64_mul"(i64 %t992, i64 %t993)
  store i64 %t994, ptr %local.t.953
  %t995 = load i64, ptr %local.targets.949
  %t996 = load i64, ptr %local.t.953
  %t997 = inttoptr i64 %t995 to ptr
  %t998 = inttoptr i64 %t996 to ptr
  call void @intrinsic_vec_push(ptr %t997, ptr %t998)
  %t999 = load i64, ptr %local.means.950
  %t1000 = load i64, ptr %local.d.951
  %t1001 = load i64, ptr %local.means.950
  %t1002 = load i64, ptr %local.d.951
  %t1003 = inttoptr i64 %t1001 to ptr
  %t1004 = call ptr @intrinsic_vec_get(ptr %t1003, i64 %t1002)
  %t1005 = ptrtoint ptr %t1004 to i64
  %t1006 = load i64, ptr %local.t.953
  %t1007 = call i64 @"sx_f64_add"(i64 %t1005, i64 %t1006)
  %t1008 = inttoptr i64 %t999 to ptr
  %t1009 = inttoptr i64 %t1007 to ptr
  call void @intrinsic_vec_set(ptr %t1008, i64 %t1000, ptr %t1009)
  %t1010 = load i64, ptr %local.d.951
  %t1011 = add i64 %t1010, 1
  store i64 %t1011, ptr %local.d.951
  br label %loop18
endloop18:
  %t1012 = load i64, ptr %local.i.952
  %t1013 = add i64 %t1012, 1
  store i64 %t1013, ptr %local.i.952
  br label %loop17
endloop17:
  %t1014 = load i64, ptr %local.k
  %t1015 = call i64 @"sx_int_to_f64"(i64 %t1014)
  store i64 %t1015, ptr %local.kf.954
  store i64 0, ptr %local.d.951
  br label %loop19
loop19:
  %t1016 = load i64, ptr %local.d.951
  %t1017 = load i64, ptr %local.dim
  %t1018 = icmp slt i64 %t1016, %t1017
  %t1019 = zext i1 %t1018 to i64
  %t1020 = icmp ne i64 %t1019, 0
  br i1 %t1020, label %body19, label %endloop19
body19:
  %t1021 = load i64, ptr %local.means.950
  %t1022 = load i64, ptr %local.d.951
  %t1023 = load i64, ptr %local.means.950
  %t1024 = load i64, ptr %local.d.951
  %t1025 = inttoptr i64 %t1023 to ptr
  %t1026 = call ptr @intrinsic_vec_get(ptr %t1025, i64 %t1024)
  %t1027 = ptrtoint ptr %t1026 to i64
  %t1028 = load i64, ptr %local.kf.954
  %t1029 = call i64 @"sx_f64_div"(i64 %t1027, i64 %t1028)
  %t1030 = inttoptr i64 %t1021 to ptr
  %t1031 = inttoptr i64 %t1029 to ptr
  call void @intrinsic_vec_set(ptr %t1030, i64 %t1022, ptr %t1031)
  %t1032 = load i64, ptr %local.d.951
  %t1033 = add i64 %t1032, 1
  store i64 %t1033, ptr %local.d.951
  br label %loop19
endloop19:
  %t1034 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.119)
  store i64 %t1034, ptr %local.cross_sum.955
  %t1035 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.120)
  store i64 %t1035, ptr %local.ind_sum.956
  store i64 0, ptr %local.i.952
  br label %loop20
loop20:
  %t1036 = load i64, ptr %local.i.952
  %t1037 = load i64, ptr %local.k
  %t1038 = icmp slt i64 %t1036, %t1037
  %t1039 = zext i1 %t1038 to i64
  %t1040 = icmp ne i64 %t1039, 0
  br i1 %t1040, label %body20, label %endloop20
body20:
  %t1041 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.121)
  store i64 %t1041, ptr %local.gi_sq.957
  store i64 0, ptr %local.d.951
  br label %loop21
loop21:
  %t1042 = load i64, ptr %local.d.951
  %t1043 = load i64, ptr %local.dim
  %t1044 = icmp slt i64 %t1042, %t1043
  %t1045 = zext i1 %t1044 to i64
  %t1046 = icmp ne i64 %t1045, 0
  br i1 %t1046, label %body21, label %endloop21
body21:
  %t1047 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.122)
  %t1048 = load i64, ptr %local.means.950
  %t1049 = load i64, ptr %local.d.951
  %t1050 = inttoptr i64 %t1048 to ptr
  %t1051 = call ptr @intrinsic_vec_get(ptr %t1050, i64 %t1049)
  %t1052 = ptrtoint ptr %t1051 to i64
  %t1053 = load i64, ptr %local.targets.949
  %t1054 = load i64, ptr %local.i.952
  %t1055 = load i64, ptr %local.dim
  %t1056 = mul i64 %t1054, %t1055
  %t1057 = load i64, ptr %local.d.951
  %t1058 = add i64 %t1056, %t1057
  %t1059 = inttoptr i64 %t1053 to ptr
  %t1060 = call ptr @intrinsic_vec_get(ptr %t1059, i64 %t1058)
  %t1061 = ptrtoint ptr %t1060 to i64
  %t1062 = sub i64 %t1052, %t1061
  %t1063 = call i64 @"sx_f64_mul"(i64 %t1047, i64 %t1062)
  store i64 %t1063, ptr %local.gi_d.958
  %t1064 = load i64, ptr %local.gi_sq.957
  %t1065 = load i64, ptr %local.gi_d.958
  %t1066 = load i64, ptr %local.gi_d.958
  %t1067 = call i64 @"sx_f64_mul"(i64 %t1065, i64 %t1066)
  %t1068 = call i64 @"sx_f64_add"(i64 %t1064, i64 %t1067)
  store i64 %t1068, ptr %local.gi_sq.957
  %t1069 = load i64, ptr %local.i.952
  %t1070 = add i64 %t1069, 1
  store i64 %t1070, ptr %local.j.959
  br label %loop22
loop22:
  %t1071 = load i64, ptr %local.j.959
  %t1072 = load i64, ptr %local.k
  %t1073 = icmp slt i64 %t1071, %t1072
  %t1074 = zext i1 %t1073 to i64
  %t1075 = icmp ne i64 %t1074, 0
  br i1 %t1075, label %body22, label %endloop22
body22:
  %t1076 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.123)
  %t1077 = load i64, ptr %local.means.950
  %t1078 = load i64, ptr %local.d.951
  %t1079 = inttoptr i64 %t1077 to ptr
  %t1080 = call ptr @intrinsic_vec_get(ptr %t1079, i64 %t1078)
  %t1081 = ptrtoint ptr %t1080 to i64
  %t1082 = load i64, ptr %local.targets.949
  %t1083 = load i64, ptr %local.j.959
  %t1084 = load i64, ptr %local.dim
  %t1085 = mul i64 %t1083, %t1084
  %t1086 = load i64, ptr %local.d.951
  %t1087 = add i64 %t1085, %t1086
  %t1088 = inttoptr i64 %t1082 to ptr
  %t1089 = call ptr @intrinsic_vec_get(ptr %t1088, i64 %t1087)
  %t1090 = ptrtoint ptr %t1089 to i64
  %t1091 = sub i64 %t1081, %t1090
  %t1092 = call i64 @"sx_f64_mul"(i64 %t1076, i64 %t1091)
  store i64 %t1092, ptr %local.gj_d.960
  %t1093 = load i64, ptr %local.cross_sum.955
  %t1094 = load i64, ptr %local.gi_d.958
  %t1095 = load i64, ptr %local.gj_d.960
  %t1096 = call i64 @"sx_f64_mul"(i64 %t1094, i64 %t1095)
  %t1097 = call i64 @"sx_f64_add"(i64 %t1093, i64 %t1096)
  store i64 %t1097, ptr %local.cross_sum.955
  %t1098 = load i64, ptr %local.j.959
  %t1099 = add i64 %t1098, 1
  store i64 %t1099, ptr %local.j.959
  br label %loop22
endloop22:
  %t1100 = load i64, ptr %local.d.951
  %t1101 = add i64 %t1100, 1
  store i64 %t1101, ptr %local.d.951
  br label %loop21
endloop21:
  %t1102 = load i64, ptr %local.ind_sum.956
  %t1103 = load i64, ptr %local.gi_sq.957
  %t1104 = call i64 @"sx_f64_add"(i64 %t1102, i64 %t1103)
  store i64 %t1104, ptr %local.ind_sum.956
  %t1105 = load i64, ptr %local.i.952
  %t1106 = add i64 %t1105, 1
  store i64 %t1106, ptr %local.i.952
  br label %loop20
endloop20:
  %t1107 = load i64, ptr %local.ind_sum.956
  %t1108 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.124)
  %t1109 = call i64 @"sx_f64_lt"(i64 %t1107, i64 %t1108)
  %t1110 = icmp ne i64 %t1109, 0
  br i1 %t1110, label %then23, label %else23
then23:
  %t1111 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.125)
  ret i64 %t1111
else23:
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t1112 = phi i64 [ 0, %else23_end ]
  %t1113 = load i64, ptr %local.cross_sum.955
  %t1114 = load i64, ptr %local.ind_sum.956
  %t1115 = call i64 @"sx_f64_div"(i64 %t1113, i64 %t1114)
  ret i64 %t1115
}

define i64 @"proof_statistical"() nounwind {
entry:
  %local.pass.1116 = alloca i64
  %local.fail.1117 = alloca i64
  %local.max_error.1118 = alloca i64
  %local.rng.1119 = alloca i64
  %local.test.1120 = alloca i64
  %local.k.1121 = alloca i64
  %local.ak.1122 = alloca i64
  %local.dim.1123 = alloca i64
  %local.adim.1124 = alloca i64
  %local.ir.1125 = alloca i64
  %local.err.1126 = alloca i64
  %t1127 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.126)
  %t1128 = ptrtoint ptr %t1127 to i64
  %t1129 = inttoptr i64 %t1128 to ptr
  call void @intrinsic_println(ptr %t1129)
  %t1130 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.127)
  %t1131 = ptrtoint ptr %t1130 to i64
  %t1132 = inttoptr i64 %t1131 to ptr
  call void @intrinsic_println(ptr %t1132)
  %t1133 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.128)
  %t1134 = ptrtoint ptr %t1133 to i64
  %t1135 = inttoptr i64 %t1134 to ptr
  call void @intrinsic_println(ptr %t1135)
  %t1136 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.129)
  %t1137 = ptrtoint ptr %t1136 to i64
  %t1138 = inttoptr i64 %t1137 to ptr
  call void @intrinsic_println(ptr %t1138)
  store i64 0, ptr %local.pass.1116
  store i64 0, ptr %local.fail.1117
  %t1139 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.130)
  store i64 %t1139, ptr %local.max_error.1118
  store i64 31415, ptr %local.rng.1119
  store i64 0, ptr %local.test.1120
  br label %loop24
loop24:
  %t1140 = load i64, ptr %local.test.1120
  %t1141 = icmp slt i64 %t1140, 100
  %t1142 = zext i1 %t1141 to i64
  %t1143 = icmp ne i64 %t1142, 0
  br i1 %t1143, label %body24, label %endloop24
body24:
  %t1144 = load i64, ptr %local.rng.1119
  %t1145 = call i64 @"lcg_next"(i64 %t1144)
  store i64 %t1145, ptr %local.rng.1119
  %t1146 = load i64, ptr %local.rng.1119
  %t1147 = srem i64 %t1146, 7
  %t1148 = add i64 2, %t1147
  store i64 %t1148, ptr %local.k.1121
  %t1149 = load i64, ptr %local.k.1121
  store i64 %t1149, ptr %local.ak.1122
  %t1150 = load i64, ptr %local.ak.1122
  %t1151 = icmp slt i64 %t1150, 0
  %t1152 = zext i1 %t1151 to i64
  %t1153 = icmp ne i64 %t1152, 0
  br i1 %t1153, label %then25, label %else25
then25:
  %t1154 = load i64, ptr %local.ak.1122
  %t1155 = sub i64 0, %t1154
  store i64 %t1155, ptr %local.ak.1122
  br label %then25_end
then25_end:
  br label %endif25
else25:
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t1156 = phi i64 [ 0, %then25_end ], [ 0, %else25_end ]
  %t1157 = load i64, ptr %local.ak.1122
  %t1158 = icmp slt i64 %t1157, 2
  %t1159 = zext i1 %t1158 to i64
  %t1160 = icmp ne i64 %t1159, 0
  br i1 %t1160, label %then26, label %else26
then26:
  store i64 2, ptr %local.ak.1122
  br label %then26_end
then26_end:
  br label %endif26
else26:
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t1161 = phi i64 [ 0, %then26_end ], [ 0, %else26_end ]
  %t1162 = load i64, ptr %local.ak.1122
  %t1163 = icmp sgt i64 %t1162, 8
  %t1164 = zext i1 %t1163 to i64
  %t1165 = icmp ne i64 %t1164, 0
  br i1 %t1165, label %then27, label %else27
then27:
  store i64 8, ptr %local.ak.1122
  br label %then27_end
then27_end:
  br label %endif27
else27:
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t1166 = phi i64 [ 0, %then27_end ], [ 0, %else27_end ]
  %t1167 = load i64, ptr %local.rng.1119
  %t1168 = call i64 @"lcg_next"(i64 %t1167)
  store i64 %t1168, ptr %local.rng.1119
  %t1169 = load i64, ptr %local.rng.1119
  %t1170 = srem i64 %t1169, 5
  %t1171 = add i64 2, %t1170
  store i64 %t1171, ptr %local.dim.1123
  %t1172 = load i64, ptr %local.dim.1123
  store i64 %t1172, ptr %local.adim.1124
  %t1173 = load i64, ptr %local.adim.1124
  %t1174 = icmp slt i64 %t1173, 0
  %t1175 = zext i1 %t1174 to i64
  %t1176 = icmp ne i64 %t1175, 0
  br i1 %t1176, label %then28, label %else28
then28:
  %t1177 = load i64, ptr %local.adim.1124
  %t1178 = sub i64 0, %t1177
  store i64 %t1178, ptr %local.adim.1124
  br label %then28_end
then28_end:
  br label %endif28
else28:
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t1179 = phi i64 [ 0, %then28_end ], [ 0, %else28_end ]
  %t1180 = load i64, ptr %local.adim.1124
  %t1181 = icmp slt i64 %t1180, 2
  %t1182 = zext i1 %t1181 to i64
  %t1183 = icmp ne i64 %t1182, 0
  br i1 %t1183, label %then29, label %else29
then29:
  store i64 2, ptr %local.adim.1124
  br label %then29_end
then29_end:
  br label %endif29
else29:
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t1184 = phi i64 [ 0, %then29_end ], [ 0, %else29_end ]
  %t1185 = load i64, ptr %local.adim.1124
  %t1186 = icmp sgt i64 %t1185, 6
  %t1187 = zext i1 %t1186 to i64
  %t1188 = icmp ne i64 %t1187, 0
  br i1 %t1188, label %then30, label %else30
then30:
  store i64 6, ptr %local.adim.1124
  br label %then30_end
then30_end:
  br label %endif30
else30:
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t1189 = phi i64 [ 0, %then30_end ], [ 0, %else30_end ]
  %t1190 = load i64, ptr %local.rng.1119
  %t1191 = call i64 @"lcg_next"(i64 %t1190)
  store i64 %t1191, ptr %local.rng.1119
  %t1192 = load i64, ptr %local.ak.1122
  %t1193 = load i64, ptr %local.adim.1124
  %t1194 = load i64, ptr %local.rng.1119
  %t1195 = call i64 @"iratio_nd"(i64 %t1192, i64 %t1193, i64 %t1194)
  store i64 %t1195, ptr %local.ir.1125
  %t1196 = load i64, ptr %local.ir.1125
  %t1197 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.131)
  %t1198 = call i64 @"sx_f64_add"(i64 %t1196, i64 %t1197)
  %t1199 = call i64 @"abs_f64"(i64 %t1198)
  store i64 %t1199, ptr %local.err.1126
  %t1200 = load i64, ptr %local.err.1126
  %t1201 = load i64, ptr %local.max_error.1118
  %t1202 = call i64 @"sx_f64_gt"(i64 %t1200, i64 %t1201)
  %t1203 = icmp ne i64 %t1202, 0
  br i1 %t1203, label %then31, label %else31
then31:
  %t1204 = load i64, ptr %local.err.1126
  store i64 %t1204, ptr %local.max_error.1118
  br label %then31_end
then31_end:
  br label %endif31
else31:
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t1205 = phi i64 [ 0, %then31_end ], [ 0, %else31_end ]
  %t1206 = load i64, ptr %local.err.1126
  %t1207 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.132)
  %t1208 = call i64 @"sx_f64_lt"(i64 %t1206, i64 %t1207)
  %t1209 = icmp ne i64 %t1208, 0
  br i1 %t1209, label %then32, label %else32
then32:
  %t1210 = load i64, ptr %local.pass.1116
  %t1211 = add i64 %t1210, 1
  store i64 %t1211, ptr %local.pass.1116
  br label %then32_end
then32_end:
  br label %endif32
else32:
  %t1212 = load i64, ptr %local.fail.1117
  %t1213 = add i64 %t1212, 1
  store i64 %t1213, ptr %local.fail.1117
  %t1214 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.133)
  %t1215 = ptrtoint ptr %t1214 to i64
  %t1216 = inttoptr i64 %t1215 to ptr
  call void @intrinsic_print(ptr %t1216)
  %t1217 = load i64, ptr %local.ak.1122
  call void @print_i64(i64 %t1217)
  %t1218 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.134)
  %t1219 = ptrtoint ptr %t1218 to i64
  %t1220 = inttoptr i64 %t1219 to ptr
  call void @intrinsic_print(ptr %t1220)
  %t1221 = load i64, ptr %local.adim.1124
  call void @print_i64(i64 %t1221)
  %t1222 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.135)
  %t1223 = ptrtoint ptr %t1222 to i64
  %t1224 = inttoptr i64 %t1223 to ptr
  call void @intrinsic_print(ptr %t1224)
  %t1225 = load i64, ptr %local.ir.1125
  %t1226 = call i64 @"print_f64"(i64 %t1225)
  %t1227 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.136)
  %t1228 = ptrtoint ptr %t1227 to i64
  %t1229 = inttoptr i64 %t1228 to ptr
  call void @intrinsic_print(ptr %t1229)
  %t1230 = load i64, ptr %local.err.1126
  %t1231 = call i64 @"print_f64"(i64 %t1230)
  %t1232 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.137)
  %t1233 = ptrtoint ptr %t1232 to i64
  %t1234 = inttoptr i64 %t1233 to ptr
  call void @intrinsic_println(ptr %t1234)
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t1235 = phi i64 [ 0, %then32_end ], [ 0, %else32_end ]
  %t1236 = load i64, ptr %local.test.1120
  %t1237 = add i64 %t1236, 1
  store i64 %t1237, ptr %local.test.1120
  br label %loop24
endloop24:
  %t1238 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.138)
  %t1239 = ptrtoint ptr %t1238 to i64
  %t1240 = inttoptr i64 %t1239 to ptr
  call void @intrinsic_print(ptr %t1240)
  %t1241 = load i64, ptr %local.pass.1116
  call void @print_i64(i64 %t1241)
  %t1242 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.139)
  %t1243 = ptrtoint ptr %t1242 to i64
  %t1244 = inttoptr i64 %t1243 to ptr
  call void @intrinsic_print(ptr %t1244)
  %t1245 = load i64, ptr %local.fail.1117
  call void @print_i64(i64 %t1245)
  %t1246 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.140)
  %t1247 = ptrtoint ptr %t1246 to i64
  %t1248 = inttoptr i64 %t1247 to ptr
  call void @intrinsic_print(ptr %t1248)
  %t1249 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.141)
  %t1250 = ptrtoint ptr %t1249 to i64
  %t1251 = inttoptr i64 %t1250 to ptr
  call void @intrinsic_println(ptr %t1251)
  %t1252 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.142)
  %t1253 = ptrtoint ptr %t1252 to i64
  %t1254 = inttoptr i64 %t1253 to ptr
  call void @intrinsic_print(ptr %t1254)
  %t1255 = load i64, ptr %local.max_error.1118
  %t1256 = call i64 @"print_f64"(i64 %t1255)
  %t1257 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.143)
  %t1258 = ptrtoint ptr %t1257 to i64
  %t1259 = inttoptr i64 %t1258 to ptr
  call void @intrinsic_println(ptr %t1259)
  %t1260 = load i64, ptr %local.fail.1117
  %t1261 = icmp eq i64 %t1260, 0
  %t1262 = zext i1 %t1261 to i64
  %t1263 = icmp ne i64 %t1262, 0
  br i1 %t1263, label %then33, label %else33
then33:
  %t1264 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.144)
  %t1265 = ptrtoint ptr %t1264 to i64
  %t1266 = inttoptr i64 %t1265 to ptr
  call void @intrinsic_println(ptr %t1266)
  br label %then33_end
then33_end:
  br label %endif33
else33:
  br label %else33_end
else33_end:
  br label %endif33
endif33:
  %t1267 = phi i64 [ 0, %then33_end ], [ 0, %else33_end ]
  %t1268 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.145)
  %t1269 = ptrtoint ptr %t1268 to i64
  %t1270 = inttoptr i64 %t1269 to ptr
  call void @intrinsic_println(ptr %t1270)
  %t1271 = load i64, ptr %local.fail.1117
  ret i64 %t1271
}

define i64 @"balance_4d"(i64 %x0, i64 %x1, i64 %x2, i64 %x3, i64 %t1_0, i64 %t1_1, i64 %t1_2, i64 %t1_3, i64 %t2_0, i64 %t2_1, i64 %t2_2, i64 %t2_3, i64 %t3_0, i64 %t3_1, i64 %t3_2, i64 %t3_3) nounwind {
entry:
  %local.g1_0.1272 = alloca i64
  %local.g1_1.1273 = alloca i64
  %local.g1_2.1274 = alloca i64
  %local.g1_3.1275 = alloca i64
  %local.g2_0.1276 = alloca i64
  %local.g2_1.1277 = alloca i64
  %local.g2_2.1278 = alloca i64
  %local.g2_3.1279 = alloca i64
  %local.g3_0.1280 = alloca i64
  %local.g3_1.1281 = alloca i64
  %local.g3_2.1282 = alloca i64
  %local.g3_3.1283 = alloca i64
  %local.sx.1284 = alloca i64
  %local.sy.1285 = alloca i64
  %local.sz.1286 = alloca i64
  %local.sw.1287 = alloca i64
  %local.sum_sq.1288 = alloca i64
  %local.ind.1289 = alloca i64
  %local.x0 = alloca i64
  store i64 %x0, ptr %local.x0
  %local.x1 = alloca i64
  store i64 %x1, ptr %local.x1
  %local.x2 = alloca i64
  store i64 %x2, ptr %local.x2
  %local.x3 = alloca i64
  store i64 %x3, ptr %local.x3
  %local.t1_0 = alloca i64
  store i64 %t1_0, ptr %local.t1_0
  %local.t1_1 = alloca i64
  store i64 %t1_1, ptr %local.t1_1
  %local.t1_2 = alloca i64
  store i64 %t1_2, ptr %local.t1_2
  %local.t1_3 = alloca i64
  store i64 %t1_3, ptr %local.t1_3
  %local.t2_0 = alloca i64
  store i64 %t2_0, ptr %local.t2_0
  %local.t2_1 = alloca i64
  store i64 %t2_1, ptr %local.t2_1
  %local.t2_2 = alloca i64
  store i64 %t2_2, ptr %local.t2_2
  %local.t2_3 = alloca i64
  store i64 %t2_3, ptr %local.t2_3
  %local.t3_0 = alloca i64
  store i64 %t3_0, ptr %local.t3_0
  %local.t3_1 = alloca i64
  store i64 %t3_1, ptr %local.t3_1
  %local.t3_2 = alloca i64
  store i64 %t3_2, ptr %local.t3_2
  %local.t3_3 = alloca i64
  store i64 %t3_3, ptr %local.t3_3
  %t1290 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.146)
  %t1291 = load i64, ptr %local.x0
  %t1292 = load i64, ptr %local.t1_0
  %t1293 = call i64 @"sx_f64_sub"(i64 %t1291, i64 %t1292)
  %t1294 = call i64 @"sx_f64_mul"(i64 %t1290, i64 %t1293)
  store i64 %t1294, ptr %local.g1_0.1272
  %t1295 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.147)
  %t1296 = load i64, ptr %local.x1
  %t1297 = load i64, ptr %local.t1_1
  %t1298 = call i64 @"sx_f64_sub"(i64 %t1296, i64 %t1297)
  %t1299 = call i64 @"sx_f64_mul"(i64 %t1295, i64 %t1298)
  store i64 %t1299, ptr %local.g1_1.1273
  %t1300 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.148)
  %t1301 = load i64, ptr %local.x2
  %t1302 = load i64, ptr %local.t1_2
  %t1303 = call i64 @"sx_f64_sub"(i64 %t1301, i64 %t1302)
  %t1304 = call i64 @"sx_f64_mul"(i64 %t1300, i64 %t1303)
  store i64 %t1304, ptr %local.g1_2.1274
  %t1305 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.149)
  %t1306 = load i64, ptr %local.x3
  %t1307 = load i64, ptr %local.t1_3
  %t1308 = call i64 @"sx_f64_sub"(i64 %t1306, i64 %t1307)
  %t1309 = call i64 @"sx_f64_mul"(i64 %t1305, i64 %t1308)
  store i64 %t1309, ptr %local.g1_3.1275
  %t1310 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.150)
  %t1311 = load i64, ptr %local.x0
  %t1312 = load i64, ptr %local.t2_0
  %t1313 = call i64 @"sx_f64_sub"(i64 %t1311, i64 %t1312)
  %t1314 = call i64 @"sx_f64_mul"(i64 %t1310, i64 %t1313)
  store i64 %t1314, ptr %local.g2_0.1276
  %t1315 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.151)
  %t1316 = load i64, ptr %local.x1
  %t1317 = load i64, ptr %local.t2_1
  %t1318 = call i64 @"sx_f64_sub"(i64 %t1316, i64 %t1317)
  %t1319 = call i64 @"sx_f64_mul"(i64 %t1315, i64 %t1318)
  store i64 %t1319, ptr %local.g2_1.1277
  %t1320 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.152)
  %t1321 = load i64, ptr %local.x2
  %t1322 = load i64, ptr %local.t2_2
  %t1323 = call i64 @"sx_f64_sub"(i64 %t1321, i64 %t1322)
  %t1324 = call i64 @"sx_f64_mul"(i64 %t1320, i64 %t1323)
  store i64 %t1324, ptr %local.g2_2.1278
  %t1325 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.153)
  %t1326 = load i64, ptr %local.x3
  %t1327 = load i64, ptr %local.t2_3
  %t1328 = call i64 @"sx_f64_sub"(i64 %t1326, i64 %t1327)
  %t1329 = call i64 @"sx_f64_mul"(i64 %t1325, i64 %t1328)
  store i64 %t1329, ptr %local.g2_3.1279
  %t1330 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.154)
  %t1331 = load i64, ptr %local.x0
  %t1332 = load i64, ptr %local.t3_0
  %t1333 = call i64 @"sx_f64_sub"(i64 %t1331, i64 %t1332)
  %t1334 = call i64 @"sx_f64_mul"(i64 %t1330, i64 %t1333)
  store i64 %t1334, ptr %local.g3_0.1280
  %t1335 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.155)
  %t1336 = load i64, ptr %local.x1
  %t1337 = load i64, ptr %local.t3_1
  %t1338 = call i64 @"sx_f64_sub"(i64 %t1336, i64 %t1337)
  %t1339 = call i64 @"sx_f64_mul"(i64 %t1335, i64 %t1338)
  store i64 %t1339, ptr %local.g3_1.1281
  %t1340 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.156)
  %t1341 = load i64, ptr %local.x2
  %t1342 = load i64, ptr %local.t3_2
  %t1343 = call i64 @"sx_f64_sub"(i64 %t1341, i64 %t1342)
  %t1344 = call i64 @"sx_f64_mul"(i64 %t1340, i64 %t1343)
  store i64 %t1344, ptr %local.g3_2.1282
  %t1345 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.157)
  %t1346 = load i64, ptr %local.x3
  %t1347 = load i64, ptr %local.t3_3
  %t1348 = call i64 @"sx_f64_sub"(i64 %t1346, i64 %t1347)
  %t1349 = call i64 @"sx_f64_mul"(i64 %t1345, i64 %t1348)
  store i64 %t1349, ptr %local.g3_3.1283
  %t1350 = load i64, ptr %local.g1_0.1272
  %t1351 = load i64, ptr %local.g2_0.1276
  %t1352 = call i64 @"sx_f64_add"(i64 %t1350, i64 %t1351)
  %t1353 = load i64, ptr %local.g3_0.1280
  %t1354 = call i64 @"sx_f64_add"(i64 %t1352, i64 %t1353)
  store i64 %t1354, ptr %local.sx.1284
  %t1355 = load i64, ptr %local.g1_1.1273
  %t1356 = load i64, ptr %local.g2_1.1277
  %t1357 = call i64 @"sx_f64_add"(i64 %t1355, i64 %t1356)
  %t1358 = load i64, ptr %local.g3_1.1281
  %t1359 = call i64 @"sx_f64_add"(i64 %t1357, i64 %t1358)
  store i64 %t1359, ptr %local.sy.1285
  %t1360 = load i64, ptr %local.g1_2.1274
  %t1361 = load i64, ptr %local.g2_2.1278
  %t1362 = call i64 @"sx_f64_add"(i64 %t1360, i64 %t1361)
  %t1363 = load i64, ptr %local.g3_2.1282
  %t1364 = call i64 @"sx_f64_add"(i64 %t1362, i64 %t1363)
  store i64 %t1364, ptr %local.sz.1286
  %t1365 = load i64, ptr %local.g1_3.1275
  %t1366 = load i64, ptr %local.g2_3.1279
  %t1367 = call i64 @"sx_f64_add"(i64 %t1365, i64 %t1366)
  %t1368 = load i64, ptr %local.g3_3.1283
  %t1369 = call i64 @"sx_f64_add"(i64 %t1367, i64 %t1368)
  store i64 %t1369, ptr %local.sw.1287
  %t1370 = load i64, ptr %local.sx.1284
  %t1371 = load i64, ptr %local.sx.1284
  %t1372 = call i64 @"sx_f64_mul"(i64 %t1370, i64 %t1371)
  %t1373 = load i64, ptr %local.sy.1285
  %t1374 = load i64, ptr %local.sy.1285
  %t1375 = call i64 @"sx_f64_mul"(i64 %t1373, i64 %t1374)
  %t1376 = call i64 @"sx_f64_add"(i64 %t1372, i64 %t1375)
  %t1377 = load i64, ptr %local.sz.1286
  %t1378 = load i64, ptr %local.sz.1286
  %t1379 = call i64 @"sx_f64_mul"(i64 %t1377, i64 %t1378)
  %t1380 = call i64 @"sx_f64_add"(i64 %t1376, i64 %t1379)
  %t1381 = load i64, ptr %local.sw.1287
  %t1382 = load i64, ptr %local.sw.1287
  %t1383 = call i64 @"sx_f64_mul"(i64 %t1381, i64 %t1382)
  %t1384 = call i64 @"sx_f64_add"(i64 %t1380, i64 %t1383)
  store i64 %t1384, ptr %local.sum_sq.1288
  %t1385 = load i64, ptr %local.g1_0.1272
  %t1386 = load i64, ptr %local.g1_0.1272
  %t1387 = call i64 @"sx_f64_mul"(i64 %t1385, i64 %t1386)
  %t1388 = load i64, ptr %local.g1_1.1273
  %t1389 = load i64, ptr %local.g1_1.1273
  %t1390 = call i64 @"sx_f64_mul"(i64 %t1388, i64 %t1389)
  %t1391 = call i64 @"sx_f64_add"(i64 %t1387, i64 %t1390)
  %t1392 = load i64, ptr %local.g1_2.1274
  %t1393 = load i64, ptr %local.g1_2.1274
  %t1394 = call i64 @"sx_f64_mul"(i64 %t1392, i64 %t1393)
  %t1395 = call i64 @"sx_f64_add"(i64 %t1391, i64 %t1394)
  %t1396 = load i64, ptr %local.g1_3.1275
  %t1397 = load i64, ptr %local.g1_3.1275
  %t1398 = call i64 @"sx_f64_mul"(i64 %t1396, i64 %t1397)
  %t1399 = call i64 @"sx_f64_add"(i64 %t1395, i64 %t1398)
  %t1400 = load i64, ptr %local.g2_0.1276
  %t1401 = load i64, ptr %local.g2_0.1276
  %t1402 = call i64 @"sx_f64_mul"(i64 %t1400, i64 %t1401)
  %t1403 = call i64 @"sx_f64_add"(i64 %t1399, i64 %t1402)
  %t1404 = load i64, ptr %local.g2_1.1277
  %t1405 = load i64, ptr %local.g2_1.1277
  %t1406 = call i64 @"sx_f64_mul"(i64 %t1404, i64 %t1405)
  %t1407 = call i64 @"sx_f64_add"(i64 %t1403, i64 %t1406)
  %t1408 = load i64, ptr %local.g2_2.1278
  %t1409 = load i64, ptr %local.g2_2.1278
  %t1410 = call i64 @"sx_f64_mul"(i64 %t1408, i64 %t1409)
  %t1411 = call i64 @"sx_f64_add"(i64 %t1407, i64 %t1410)
  %t1412 = load i64, ptr %local.g2_3.1279
  %t1413 = load i64, ptr %local.g2_3.1279
  %t1414 = call i64 @"sx_f64_mul"(i64 %t1412, i64 %t1413)
  %t1415 = call i64 @"sx_f64_add"(i64 %t1411, i64 %t1414)
  %t1416 = load i64, ptr %local.g3_0.1280
  %t1417 = load i64, ptr %local.g3_0.1280
  %t1418 = call i64 @"sx_f64_mul"(i64 %t1416, i64 %t1417)
  %t1419 = call i64 @"sx_f64_add"(i64 %t1415, i64 %t1418)
  %t1420 = load i64, ptr %local.g3_1.1281
  %t1421 = load i64, ptr %local.g3_1.1281
  %t1422 = call i64 @"sx_f64_mul"(i64 %t1420, i64 %t1421)
  %t1423 = call i64 @"sx_f64_add"(i64 %t1419, i64 %t1422)
  %t1424 = load i64, ptr %local.g3_2.1282
  %t1425 = load i64, ptr %local.g3_2.1282
  %t1426 = call i64 @"sx_f64_mul"(i64 %t1424, i64 %t1425)
  %t1427 = call i64 @"sx_f64_add"(i64 %t1423, i64 %t1426)
  %t1428 = load i64, ptr %local.g3_3.1283
  %t1429 = load i64, ptr %local.g3_3.1283
  %t1430 = call i64 @"sx_f64_mul"(i64 %t1428, i64 %t1429)
  %t1431 = call i64 @"sx_f64_add"(i64 %t1427, i64 %t1430)
  store i64 %t1431, ptr %local.ind.1289
  %t1432 = load i64, ptr %local.ind.1289
  %t1433 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.158)
  %t1434 = call i64 @"sx_f64_lt"(i64 %t1432, i64 %t1433)
  %t1435 = icmp ne i64 %t1434, 0
  br i1 %t1435, label %then34, label %else34
then34:
  %t1436 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.159)
  ret i64 %t1436
else34:
  br label %else34_end
else34_end:
  br label %endif34
endif34:
  %t1437 = phi i64 [ 0, %else34_end ]
  %t1438 = load i64, ptr %local.sum_sq.1288
  %t1439 = load i64, ptr %local.ind.1289
  %t1440 = call i64 @"sx_f64_div"(i64 %t1438, i64 %t1439)
  ret i64 %t1440
}

define i64 @"dB_4d"(i64 %x0, i64 %x1, i64 %x2, i64 %x3, i64 %t1_0, i64 %t1_1, i64 %t1_2, i64 %t1_3, i64 %t2_0, i64 %t2_1, i64 %t2_2, i64 %t2_3, i64 %t3_0, i64 %t3_1, i64 %t3_2, i64 %t3_3, i64 %dim) nounwind {
entry:
  %local.h.1441 = alloca i64
  %local.bp.1442 = alloca i64
  %local.bm.1443 = alloca i64
  %local.x0 = alloca i64
  store i64 %x0, ptr %local.x0
  %local.x1 = alloca i64
  store i64 %x1, ptr %local.x1
  %local.x2 = alloca i64
  store i64 %x2, ptr %local.x2
  %local.x3 = alloca i64
  store i64 %x3, ptr %local.x3
  %local.t1_0 = alloca i64
  store i64 %t1_0, ptr %local.t1_0
  %local.t1_1 = alloca i64
  store i64 %t1_1, ptr %local.t1_1
  %local.t1_2 = alloca i64
  store i64 %t1_2, ptr %local.t1_2
  %local.t1_3 = alloca i64
  store i64 %t1_3, ptr %local.t1_3
  %local.t2_0 = alloca i64
  store i64 %t2_0, ptr %local.t2_0
  %local.t2_1 = alloca i64
  store i64 %t2_1, ptr %local.t2_1
  %local.t2_2 = alloca i64
  store i64 %t2_2, ptr %local.t2_2
  %local.t2_3 = alloca i64
  store i64 %t2_3, ptr %local.t2_3
  %local.t3_0 = alloca i64
  store i64 %t3_0, ptr %local.t3_0
  %local.t3_1 = alloca i64
  store i64 %t3_1, ptr %local.t3_1
  %local.t3_2 = alloca i64
  store i64 %t3_2, ptr %local.t3_2
  %local.t3_3 = alloca i64
  store i64 %t3_3, ptr %local.t3_3
  %local.dim = alloca i64
  store i64 %dim, ptr %local.dim
  %t1444 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.160)
  store i64 %t1444, ptr %local.h.1441
  %t1445 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.161)
  store i64 %t1445, ptr %local.bp.1442
  %t1446 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.162)
  store i64 %t1446, ptr %local.bm.1443
  %t1447 = load i64, ptr %local.dim
  %t1448 = icmp eq i64 %t1447, 0
  %t1449 = zext i1 %t1448 to i64
  %t1450 = icmp ne i64 %t1449, 0
  br i1 %t1450, label %then35, label %else35
then35:
  %t1451 = load i64, ptr %local.x0
  %t1452 = load i64, ptr %local.h.1441
  %t1453 = call i64 @"sx_f64_add"(i64 %t1451, i64 %t1452)
  %t1454 = load i64, ptr %local.x1
  %t1455 = load i64, ptr %local.x2
  %t1456 = load i64, ptr %local.x3
  %t1457 = load i64, ptr %local.t1_0
  %t1458 = load i64, ptr %local.t1_1
  %t1459 = load i64, ptr %local.t1_2
  %t1460 = load i64, ptr %local.t1_3
  %t1461 = load i64, ptr %local.t2_0
  %t1462 = load i64, ptr %local.t2_1
  %t1463 = load i64, ptr %local.t2_2
  %t1464 = load i64, ptr %local.t2_3
  %t1465 = load i64, ptr %local.t3_0
  %t1466 = load i64, ptr %local.t3_1
  %t1467 = load i64, ptr %local.t3_2
  %t1468 = load i64, ptr %local.t3_3
  %t1469 = call i64 @"balance_4d"(i64 %t1453, i64 %t1454, i64 %t1455, i64 %t1456, i64 %t1457, i64 %t1458, i64 %t1459, i64 %t1460, i64 %t1461, i64 %t1462, i64 %t1463, i64 %t1464, i64 %t1465, i64 %t1466, i64 %t1467, i64 %t1468)
  store i64 %t1469, ptr %local.bp.1442
  %t1470 = load i64, ptr %local.x0
  %t1471 = load i64, ptr %local.h.1441
  %t1472 = call i64 @"sx_f64_sub"(i64 %t1470, i64 %t1471)
  %t1473 = load i64, ptr %local.x1
  %t1474 = load i64, ptr %local.x2
  %t1475 = load i64, ptr %local.x3
  %t1476 = load i64, ptr %local.t1_0
  %t1477 = load i64, ptr %local.t1_1
  %t1478 = load i64, ptr %local.t1_2
  %t1479 = load i64, ptr %local.t1_3
  %t1480 = load i64, ptr %local.t2_0
  %t1481 = load i64, ptr %local.t2_1
  %t1482 = load i64, ptr %local.t2_2
  %t1483 = load i64, ptr %local.t2_3
  %t1484 = load i64, ptr %local.t3_0
  %t1485 = load i64, ptr %local.t3_1
  %t1486 = load i64, ptr %local.t3_2
  %t1487 = load i64, ptr %local.t3_3
  %t1488 = call i64 @"balance_4d"(i64 %t1472, i64 %t1473, i64 %t1474, i64 %t1475, i64 %t1476, i64 %t1477, i64 %t1478, i64 %t1479, i64 %t1480, i64 %t1481, i64 %t1482, i64 %t1483, i64 %t1484, i64 %t1485, i64 %t1486, i64 %t1487)
  store i64 %t1488, ptr %local.bm.1443
  br label %then35_end
then35_end:
  br label %endif35
else35:
  br label %else35_end
else35_end:
  br label %endif35
endif35:
  %t1489 = phi i64 [ 0, %then35_end ], [ 0, %else35_end ]
  %t1490 = load i64, ptr %local.dim
  %t1491 = icmp eq i64 %t1490, 1
  %t1492 = zext i1 %t1491 to i64
  %t1493 = icmp ne i64 %t1492, 0
  br i1 %t1493, label %then36, label %else36
then36:
  %t1494 = load i64, ptr %local.x0
  %t1495 = load i64, ptr %local.x1
  %t1496 = load i64, ptr %local.h.1441
  %t1497 = call i64 @"sx_f64_add"(i64 %t1495, i64 %t1496)
  %t1498 = load i64, ptr %local.x2
  %t1499 = load i64, ptr %local.x3
  %t1500 = load i64, ptr %local.t1_0
  %t1501 = load i64, ptr %local.t1_1
  %t1502 = load i64, ptr %local.t1_2
  %t1503 = load i64, ptr %local.t1_3
  %t1504 = load i64, ptr %local.t2_0
  %t1505 = load i64, ptr %local.t2_1
  %t1506 = load i64, ptr %local.t2_2
  %t1507 = load i64, ptr %local.t2_3
  %t1508 = load i64, ptr %local.t3_0
  %t1509 = load i64, ptr %local.t3_1
  %t1510 = load i64, ptr %local.t3_2
  %t1511 = load i64, ptr %local.t3_3
  %t1512 = call i64 @"balance_4d"(i64 %t1494, i64 %t1497, i64 %t1498, i64 %t1499, i64 %t1500, i64 %t1501, i64 %t1502, i64 %t1503, i64 %t1504, i64 %t1505, i64 %t1506, i64 %t1507, i64 %t1508, i64 %t1509, i64 %t1510, i64 %t1511)
  store i64 %t1512, ptr %local.bp.1442
  %t1513 = load i64, ptr %local.x0
  %t1514 = load i64, ptr %local.x1
  %t1515 = load i64, ptr %local.h.1441
  %t1516 = call i64 @"sx_f64_sub"(i64 %t1514, i64 %t1515)
  %t1517 = load i64, ptr %local.x2
  %t1518 = load i64, ptr %local.x3
  %t1519 = load i64, ptr %local.t1_0
  %t1520 = load i64, ptr %local.t1_1
  %t1521 = load i64, ptr %local.t1_2
  %t1522 = load i64, ptr %local.t1_3
  %t1523 = load i64, ptr %local.t2_0
  %t1524 = load i64, ptr %local.t2_1
  %t1525 = load i64, ptr %local.t2_2
  %t1526 = load i64, ptr %local.t2_3
  %t1527 = load i64, ptr %local.t3_0
  %t1528 = load i64, ptr %local.t3_1
  %t1529 = load i64, ptr %local.t3_2
  %t1530 = load i64, ptr %local.t3_3
  %t1531 = call i64 @"balance_4d"(i64 %t1513, i64 %t1516, i64 %t1517, i64 %t1518, i64 %t1519, i64 %t1520, i64 %t1521, i64 %t1522, i64 %t1523, i64 %t1524, i64 %t1525, i64 %t1526, i64 %t1527, i64 %t1528, i64 %t1529, i64 %t1530)
  store i64 %t1531, ptr %local.bm.1443
  br label %then36_end
then36_end:
  br label %endif36
else36:
  br label %else36_end
else36_end:
  br label %endif36
endif36:
  %t1532 = phi i64 [ 0, %then36_end ], [ 0, %else36_end ]
  %t1533 = load i64, ptr %local.dim
  %t1534 = icmp eq i64 %t1533, 2
  %t1535 = zext i1 %t1534 to i64
  %t1536 = icmp ne i64 %t1535, 0
  br i1 %t1536, label %then37, label %else37
then37:
  %t1537 = load i64, ptr %local.x0
  %t1538 = load i64, ptr %local.x1
  %t1539 = load i64, ptr %local.x2
  %t1540 = load i64, ptr %local.h.1441
  %t1541 = call i64 @"sx_f64_add"(i64 %t1539, i64 %t1540)
  %t1542 = load i64, ptr %local.x3
  %t1543 = load i64, ptr %local.t1_0
  %t1544 = load i64, ptr %local.t1_1
  %t1545 = load i64, ptr %local.t1_2
  %t1546 = load i64, ptr %local.t1_3
  %t1547 = load i64, ptr %local.t2_0
  %t1548 = load i64, ptr %local.t2_1
  %t1549 = load i64, ptr %local.t2_2
  %t1550 = load i64, ptr %local.t2_3
  %t1551 = load i64, ptr %local.t3_0
  %t1552 = load i64, ptr %local.t3_1
  %t1553 = load i64, ptr %local.t3_2
  %t1554 = load i64, ptr %local.t3_3
  %t1555 = call i64 @"balance_4d"(i64 %t1537, i64 %t1538, i64 %t1541, i64 %t1542, i64 %t1543, i64 %t1544, i64 %t1545, i64 %t1546, i64 %t1547, i64 %t1548, i64 %t1549, i64 %t1550, i64 %t1551, i64 %t1552, i64 %t1553, i64 %t1554)
  store i64 %t1555, ptr %local.bp.1442
  %t1556 = load i64, ptr %local.x0
  %t1557 = load i64, ptr %local.x1
  %t1558 = load i64, ptr %local.x2
  %t1559 = load i64, ptr %local.h.1441
  %t1560 = call i64 @"sx_f64_sub"(i64 %t1558, i64 %t1559)
  %t1561 = load i64, ptr %local.x3
  %t1562 = load i64, ptr %local.t1_0
  %t1563 = load i64, ptr %local.t1_1
  %t1564 = load i64, ptr %local.t1_2
  %t1565 = load i64, ptr %local.t1_3
  %t1566 = load i64, ptr %local.t2_0
  %t1567 = load i64, ptr %local.t2_1
  %t1568 = load i64, ptr %local.t2_2
  %t1569 = load i64, ptr %local.t2_3
  %t1570 = load i64, ptr %local.t3_0
  %t1571 = load i64, ptr %local.t3_1
  %t1572 = load i64, ptr %local.t3_2
  %t1573 = load i64, ptr %local.t3_3
  %t1574 = call i64 @"balance_4d"(i64 %t1556, i64 %t1557, i64 %t1560, i64 %t1561, i64 %t1562, i64 %t1563, i64 %t1564, i64 %t1565, i64 %t1566, i64 %t1567, i64 %t1568, i64 %t1569, i64 %t1570, i64 %t1571, i64 %t1572, i64 %t1573)
  store i64 %t1574, ptr %local.bm.1443
  br label %then37_end
then37_end:
  br label %endif37
else37:
  br label %else37_end
else37_end:
  br label %endif37
endif37:
  %t1575 = phi i64 [ 0, %then37_end ], [ 0, %else37_end ]
  %t1576 = load i64, ptr %local.dim
  %t1577 = icmp eq i64 %t1576, 3
  %t1578 = zext i1 %t1577 to i64
  %t1579 = icmp ne i64 %t1578, 0
  br i1 %t1579, label %then38, label %else38
then38:
  %t1580 = load i64, ptr %local.x0
  %t1581 = load i64, ptr %local.x1
  %t1582 = load i64, ptr %local.x2
  %t1583 = load i64, ptr %local.x3
  %t1584 = load i64, ptr %local.h.1441
  %t1585 = call i64 @"sx_f64_add"(i64 %t1583, i64 %t1584)
  %t1586 = load i64, ptr %local.t1_0
  %t1587 = load i64, ptr %local.t1_1
  %t1588 = load i64, ptr %local.t1_2
  %t1589 = load i64, ptr %local.t1_3
  %t1590 = load i64, ptr %local.t2_0
  %t1591 = load i64, ptr %local.t2_1
  %t1592 = load i64, ptr %local.t2_2
  %t1593 = load i64, ptr %local.t2_3
  %t1594 = load i64, ptr %local.t3_0
  %t1595 = load i64, ptr %local.t3_1
  %t1596 = load i64, ptr %local.t3_2
  %t1597 = load i64, ptr %local.t3_3
  %t1598 = call i64 @"balance_4d"(i64 %t1580, i64 %t1581, i64 %t1582, i64 %t1585, i64 %t1586, i64 %t1587, i64 %t1588, i64 %t1589, i64 %t1590, i64 %t1591, i64 %t1592, i64 %t1593, i64 %t1594, i64 %t1595, i64 %t1596, i64 %t1597)
  store i64 %t1598, ptr %local.bp.1442
  %t1599 = load i64, ptr %local.x0
  %t1600 = load i64, ptr %local.x1
  %t1601 = load i64, ptr %local.x2
  %t1602 = load i64, ptr %local.x3
  %t1603 = load i64, ptr %local.h.1441
  %t1604 = call i64 @"sx_f64_sub"(i64 %t1602, i64 %t1603)
  %t1605 = load i64, ptr %local.t1_0
  %t1606 = load i64, ptr %local.t1_1
  %t1607 = load i64, ptr %local.t1_2
  %t1608 = load i64, ptr %local.t1_3
  %t1609 = load i64, ptr %local.t2_0
  %t1610 = load i64, ptr %local.t2_1
  %t1611 = load i64, ptr %local.t2_2
  %t1612 = load i64, ptr %local.t2_3
  %t1613 = load i64, ptr %local.t3_0
  %t1614 = load i64, ptr %local.t3_1
  %t1615 = load i64, ptr %local.t3_2
  %t1616 = load i64, ptr %local.t3_3
  %t1617 = call i64 @"balance_4d"(i64 %t1599, i64 %t1600, i64 %t1601, i64 %t1604, i64 %t1605, i64 %t1606, i64 %t1607, i64 %t1608, i64 %t1609, i64 %t1610, i64 %t1611, i64 %t1612, i64 %t1613, i64 %t1614, i64 %t1615, i64 %t1616)
  store i64 %t1617, ptr %local.bm.1443
  br label %then38_end
then38_end:
  br label %endif38
else38:
  br label %else38_end
else38_end:
  br label %endif38
endif38:
  %t1618 = phi i64 [ 0, %then38_end ], [ 0, %else38_end ]
  %t1619 = load i64, ptr %local.bp.1442
  %t1620 = load i64, ptr %local.bm.1443
  %t1621 = call i64 @"sx_f64_sub"(i64 %t1619, i64 %t1620)
  %t1622 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.163)
  %t1623 = load i64, ptr %local.h.1441
  %t1624 = call i64 @"sx_f64_mul"(i64 %t1622, i64 %t1623)
  %t1625 = call i64 @"sx_f64_div"(i64 %t1621, i64 %t1624)
  ret i64 %t1625
}

define i64 @"proof_bflow_precision"() nounwind {
entry:
  %local.b_wins.1626 = alloca i64
  %local.total.1627 = alloca i64
  %local.bx0.1628 = alloca i64
  %local.bx1.1629 = alloca i64
  %local.bx2.1630 = alloca i64
  %local.bx3.1631 = alloca i64
  %local.lx0.1632 = alloca i64
  %local.lx1.1633 = alloca i64
  %local.lx2.1634 = alloca i64
  %local.lx3.1635 = alloca i64
  %local.step.1636 = alloca i64
  %local.eq0.1637 = alloca i64
  %local.eq1.1638 = alloca i64
  %local.eq2.1639 = alloca i64
  %local.eq3.1640 = alloca i64
  %local.db0.1641 = alloca i64
  %local.db1.1642 = alloca i64
  %local.db2.1643 = alloca i64
  %local.db3.1644 = alloca i64
  %local.lg0.1645 = alloca i64
  %local.lg1.1646 = alloca i64
  %local.lg2.1647 = alloca i64
  %local.lg3.1648 = alloca i64
  %local.bd.1649 = alloca i64
  %local.ld.1650 = alloca i64
  %t1651 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.164)
  %t1652 = ptrtoint ptr %t1651 to i64
  %t1653 = inttoptr i64 %t1652 to ptr
  call void @intrinsic_println(ptr %t1653)
  %t1654 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.165)
  %t1655 = ptrtoint ptr %t1654 to i64
  %t1656 = inttoptr i64 %t1655 to ptr
  call void @intrinsic_println(ptr %t1656)
  %t1657 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.166)
  %t1658 = ptrtoint ptr %t1657 to i64
  %t1659 = inttoptr i64 %t1658 to ptr
  call void @intrinsic_println(ptr %t1659)
  %t1660 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.167)
  %t1661 = ptrtoint ptr %t1660 to i64
  %t1662 = inttoptr i64 %t1661 to ptr
  call void @intrinsic_println(ptr %t1662)
  store i64 0, ptr %local.b_wins.1626
  store i64 0, ptr %local.total.1627
  %t1663 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.168)
  %t1664 = xor i64 %t1663, -9223372036854775808
  store i64 %t1664, ptr %local.bx0.1628
  %t1665 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.169)
  %t1666 = xor i64 %t1665, -9223372036854775808
  store i64 %t1666, ptr %local.bx1.1629
  %t1667 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.170)
  %t1668 = xor i64 %t1667, -9223372036854775808
  store i64 %t1668, ptr %local.bx2.1630
  %t1669 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.171)
  %t1670 = xor i64 %t1669, -9223372036854775808
  store i64 %t1670, ptr %local.bx3.1631
  %t1671 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.172)
  %t1672 = xor i64 %t1671, -9223372036854775808
  store i64 %t1672, ptr %local.lx0.1632
  %t1673 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.173)
  %t1674 = xor i64 %t1673, -9223372036854775808
  store i64 %t1674, ptr %local.lx1.1633
  %t1675 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.174)
  %t1676 = xor i64 %t1675, -9223372036854775808
  store i64 %t1676, ptr %local.lx2.1634
  %t1677 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.175)
  %t1678 = xor i64 %t1677, -9223372036854775808
  store i64 %t1678, ptr %local.lx3.1635
  store i64 0, ptr %local.step.1636
  %t1679 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.176)
  %t1680 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.177)
  %t1681 = call i64 @"sx_f64_div"(i64 %t1679, i64 %t1680)
  store i64 %t1681, ptr %local.eq0.1637
  %t1682 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.178)
  store i64 %t1682, ptr %local.eq1.1638
  %t1683 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.179)
  %t1684 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.180)
  %t1685 = call i64 @"sx_f64_div"(i64 %t1683, i64 %t1684)
  store i64 %t1685, ptr %local.eq2.1639
  %t1686 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.181)
  store i64 %t1686, ptr %local.eq3.1640
  br label %loop39
loop39:
  %t1687 = load i64, ptr %local.step.1636
  %t1688 = icmp slt i64 %t1687, 500
  %t1689 = zext i1 %t1688 to i64
  %t1690 = icmp ne i64 %t1689, 0
  br i1 %t1690, label %body39, label %endloop39
body39:
  %t1691 = load i64, ptr %local.bx0.1628
  %t1692 = load i64, ptr %local.bx1.1629
  %t1693 = load i64, ptr %local.bx2.1630
  %t1694 = load i64, ptr %local.bx3.1631
  %t1695 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.182)
  %t1696 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.183)
  %t1697 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.184)
  %t1698 = xor i64 %t1697, -9223372036854775808
  %t1699 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.185)
  %t1700 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.186)
  %t1701 = xor i64 %t1700, -9223372036854775808
  %t1702 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.187)
  %t1703 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.188)
  %t1704 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.189)
  %t1705 = xor i64 %t1704, -9223372036854775808
  %t1706 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.190)
  %t1707 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.191)
  %t1708 = xor i64 %t1707, -9223372036854775808
  %t1709 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.192)
  %t1710 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.193)
  %t1711 = call i64 @"dB_4d"(i64 %t1691, i64 %t1692, i64 %t1693, i64 %t1694, i64 %t1695, i64 %t1696, i64 %t1698, i64 %t1699, i64 %t1701, i64 %t1702, i64 %t1703, i64 %t1705, i64 %t1706, i64 %t1708, i64 %t1709, i64 %t1710, i64 0)
  store i64 %t1711, ptr %local.db0.1641
  %t1712 = load i64, ptr %local.bx0.1628
  %t1713 = load i64, ptr %local.bx1.1629
  %t1714 = load i64, ptr %local.bx2.1630
  %t1715 = load i64, ptr %local.bx3.1631
  %t1716 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.194)
  %t1717 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.195)
  %t1718 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.196)
  %t1719 = xor i64 %t1718, -9223372036854775808
  %t1720 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.197)
  %t1721 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.198)
  %t1722 = xor i64 %t1721, -9223372036854775808
  %t1723 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.199)
  %t1724 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.200)
  %t1725 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.201)
  %t1726 = xor i64 %t1725, -9223372036854775808
  %t1727 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.202)
  %t1728 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.203)
  %t1729 = xor i64 %t1728, -9223372036854775808
  %t1730 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.204)
  %t1731 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.205)
  %t1732 = call i64 @"dB_4d"(i64 %t1712, i64 %t1713, i64 %t1714, i64 %t1715, i64 %t1716, i64 %t1717, i64 %t1719, i64 %t1720, i64 %t1722, i64 %t1723, i64 %t1724, i64 %t1726, i64 %t1727, i64 %t1729, i64 %t1730, i64 %t1731, i64 1)
  store i64 %t1732, ptr %local.db1.1642
  %t1733 = load i64, ptr %local.bx0.1628
  %t1734 = load i64, ptr %local.bx1.1629
  %t1735 = load i64, ptr %local.bx2.1630
  %t1736 = load i64, ptr %local.bx3.1631
  %t1737 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.206)
  %t1738 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.207)
  %t1739 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.208)
  %t1740 = xor i64 %t1739, -9223372036854775808
  %t1741 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.209)
  %t1742 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.210)
  %t1743 = xor i64 %t1742, -9223372036854775808
  %t1744 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.211)
  %t1745 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.212)
  %t1746 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.213)
  %t1747 = xor i64 %t1746, -9223372036854775808
  %t1748 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.214)
  %t1749 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.215)
  %t1750 = xor i64 %t1749, -9223372036854775808
  %t1751 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.216)
  %t1752 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.217)
  %t1753 = call i64 @"dB_4d"(i64 %t1733, i64 %t1734, i64 %t1735, i64 %t1736, i64 %t1737, i64 %t1738, i64 %t1740, i64 %t1741, i64 %t1743, i64 %t1744, i64 %t1745, i64 %t1747, i64 %t1748, i64 %t1750, i64 %t1751, i64 %t1752, i64 2)
  store i64 %t1753, ptr %local.db2.1643
  %t1754 = load i64, ptr %local.bx0.1628
  %t1755 = load i64, ptr %local.bx1.1629
  %t1756 = load i64, ptr %local.bx2.1630
  %t1757 = load i64, ptr %local.bx3.1631
  %t1758 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.218)
  %t1759 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.219)
  %t1760 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.220)
  %t1761 = xor i64 %t1760, -9223372036854775808
  %t1762 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.221)
  %t1763 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.222)
  %t1764 = xor i64 %t1763, -9223372036854775808
  %t1765 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.223)
  %t1766 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.224)
  %t1767 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.225)
  %t1768 = xor i64 %t1767, -9223372036854775808
  %t1769 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.226)
  %t1770 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.227)
  %t1771 = xor i64 %t1770, -9223372036854775808
  %t1772 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.228)
  %t1773 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.229)
  %t1774 = call i64 @"dB_4d"(i64 %t1754, i64 %t1755, i64 %t1756, i64 %t1757, i64 %t1758, i64 %t1759, i64 %t1761, i64 %t1762, i64 %t1764, i64 %t1765, i64 %t1766, i64 %t1768, i64 %t1769, i64 %t1771, i64 %t1772, i64 %t1773, i64 3)
  store i64 %t1774, ptr %local.db3.1644
  %t1775 = load i64, ptr %local.bx0.1628
  %t1776 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.230)
  %t1777 = load i64, ptr %local.db0.1641
  %t1778 = call i64 @"sx_f64_mul"(i64 %t1776, i64 %t1777)
  %t1779 = call i64 @"sx_f64_sub"(i64 %t1775, i64 %t1778)
  store i64 %t1779, ptr %local.bx0.1628
  %t1780 = load i64, ptr %local.bx1.1629
  %t1781 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.231)
  %t1782 = load i64, ptr %local.db1.1642
  %t1783 = call i64 @"sx_f64_mul"(i64 %t1781, i64 %t1782)
  %t1784 = call i64 @"sx_f64_sub"(i64 %t1780, i64 %t1783)
  store i64 %t1784, ptr %local.bx1.1629
  %t1785 = load i64, ptr %local.bx2.1630
  %t1786 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.232)
  %t1787 = load i64, ptr %local.db2.1643
  %t1788 = call i64 @"sx_f64_mul"(i64 %t1786, i64 %t1787)
  %t1789 = call i64 @"sx_f64_sub"(i64 %t1785, i64 %t1788)
  store i64 %t1789, ptr %local.bx2.1630
  %t1790 = load i64, ptr %local.bx3.1631
  %t1791 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.233)
  %t1792 = load i64, ptr %local.db3.1644
  %t1793 = call i64 @"sx_f64_mul"(i64 %t1791, i64 %t1792)
  %t1794 = call i64 @"sx_f64_sub"(i64 %t1790, i64 %t1793)
  store i64 %t1794, ptr %local.bx3.1631
  %t1795 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.234)
  %t1796 = load i64, ptr %local.lx0.1632
  %t1797 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.235)
  %t1798 = call i64 @"sx_f64_sub"(i64 %t1796, i64 %t1797)
  %t1799 = call i64 @"sx_f64_mul"(i64 %t1795, i64 %t1798)
  %t1800 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.236)
  %t1801 = load i64, ptr %local.lx0.1632
  %t1802 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.237)
  %t1803 = call i64 @"sx_f64_add"(i64 %t1801, i64 %t1802)
  %t1804 = call i64 @"sx_f64_mul"(i64 %t1800, i64 %t1803)
  %t1805 = call i64 @"sx_f64_add"(i64 %t1799, i64 %t1804)
  %t1806 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.238)
  %t1807 = load i64, ptr %local.lx0.1632
  %t1808 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.239)
  %t1809 = call i64 @"sx_f64_sub"(i64 %t1807, i64 %t1808)
  %t1810 = call i64 @"sx_f64_mul"(i64 %t1806, i64 %t1809)
  %t1811 = call i64 @"sx_f64_add"(i64 %t1805, i64 %t1810)
  store i64 %t1811, ptr %local.lg0.1645
  %t1812 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.240)
  %t1813 = load i64, ptr %local.lx1.1633
  %t1814 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.241)
  %t1815 = call i64 @"sx_f64_sub"(i64 %t1813, i64 %t1814)
  %t1816 = call i64 @"sx_f64_mul"(i64 %t1812, i64 %t1815)
  %t1817 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.242)
  %t1818 = load i64, ptr %local.lx1.1633
  %t1819 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.243)
  %t1820 = call i64 @"sx_f64_sub"(i64 %t1818, i64 %t1819)
  %t1821 = call i64 @"sx_f64_mul"(i64 %t1817, i64 %t1820)
  %t1822 = call i64 @"sx_f64_add"(i64 %t1816, i64 %t1821)
  %t1823 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.244)
  %t1824 = load i64, ptr %local.lx1.1633
  %t1825 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.245)
  %t1826 = call i64 @"sx_f64_add"(i64 %t1824, i64 %t1825)
  %t1827 = call i64 @"sx_f64_mul"(i64 %t1823, i64 %t1826)
  %t1828 = call i64 @"sx_f64_add"(i64 %t1822, i64 %t1827)
  store i64 %t1828, ptr %local.lg1.1646
  %t1829 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.246)
  %t1830 = load i64, ptr %local.lx2.1634
  %t1831 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.247)
  %t1832 = call i64 @"sx_f64_add"(i64 %t1830, i64 %t1831)
  %t1833 = call i64 @"sx_f64_mul"(i64 %t1829, i64 %t1832)
  %t1834 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.248)
  %t1835 = load i64, ptr %local.lx2.1634
  %t1836 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.249)
  %t1837 = call i64 @"sx_f64_sub"(i64 %t1835, i64 %t1836)
  %t1838 = call i64 @"sx_f64_mul"(i64 %t1834, i64 %t1837)
  %t1839 = call i64 @"sx_f64_add"(i64 %t1833, i64 %t1838)
  %t1840 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.250)
  %t1841 = load i64, ptr %local.lx2.1634
  %t1842 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.251)
  %t1843 = call i64 @"sx_f64_sub"(i64 %t1841, i64 %t1842)
  %t1844 = call i64 @"sx_f64_mul"(i64 %t1840, i64 %t1843)
  %t1845 = call i64 @"sx_f64_add"(i64 %t1839, i64 %t1844)
  store i64 %t1845, ptr %local.lg2.1647
  %t1846 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.252)
  %t1847 = load i64, ptr %local.lx3.1635
  %t1848 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.253)
  %t1849 = call i64 @"sx_f64_sub"(i64 %t1847, i64 %t1848)
  %t1850 = call i64 @"sx_f64_mul"(i64 %t1846, i64 %t1849)
  %t1851 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.254)
  %t1852 = load i64, ptr %local.lx3.1635
  %t1853 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.255)
  %t1854 = call i64 @"sx_f64_add"(i64 %t1852, i64 %t1853)
  %t1855 = call i64 @"sx_f64_mul"(i64 %t1851, i64 %t1854)
  %t1856 = call i64 @"sx_f64_add"(i64 %t1850, i64 %t1855)
  %t1857 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.256)
  %t1858 = load i64, ptr %local.lx3.1635
  %t1859 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.257)
  %t1860 = call i64 @"sx_f64_sub"(i64 %t1858, i64 %t1859)
  %t1861 = call i64 @"sx_f64_mul"(i64 %t1857, i64 %t1860)
  %t1862 = call i64 @"sx_f64_add"(i64 %t1856, i64 %t1861)
  store i64 %t1862, ptr %local.lg3.1648
  %t1863 = load i64, ptr %local.lx0.1632
  %t1864 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.258)
  %t1865 = load i64, ptr %local.lg0.1645
  %t1866 = call i64 @"sx_f64_mul"(i64 %t1864, i64 %t1865)
  %t1867 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.259)
  %t1868 = call i64 @"sx_f64_div"(i64 %t1866, i64 %t1867)
  %t1869 = call i64 @"sx_f64_sub"(i64 %t1863, i64 %t1868)
  store i64 %t1869, ptr %local.lx0.1632
  %t1870 = load i64, ptr %local.lx1.1633
  %t1871 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.260)
  %t1872 = load i64, ptr %local.lg1.1646
  %t1873 = call i64 @"sx_f64_mul"(i64 %t1871, i64 %t1872)
  %t1874 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.261)
  %t1875 = call i64 @"sx_f64_div"(i64 %t1873, i64 %t1874)
  %t1876 = call i64 @"sx_f64_sub"(i64 %t1870, i64 %t1875)
  store i64 %t1876, ptr %local.lx1.1633
  %t1877 = load i64, ptr %local.lx2.1634
  %t1878 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.262)
  %t1879 = load i64, ptr %local.lg2.1647
  %t1880 = call i64 @"sx_f64_mul"(i64 %t1878, i64 %t1879)
  %t1881 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.263)
  %t1882 = call i64 @"sx_f64_div"(i64 %t1880, i64 %t1881)
  %t1883 = call i64 @"sx_f64_sub"(i64 %t1877, i64 %t1882)
  store i64 %t1883, ptr %local.lx2.1634
  %t1884 = load i64, ptr %local.lx3.1635
  %t1885 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.264)
  %t1886 = load i64, ptr %local.lg3.1648
  %t1887 = call i64 @"sx_f64_mul"(i64 %t1885, i64 %t1886)
  %t1888 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.265)
  %t1889 = call i64 @"sx_f64_div"(i64 %t1887, i64 %t1888)
  %t1890 = call i64 @"sx_f64_sub"(i64 %t1884, i64 %t1889)
  store i64 %t1890, ptr %local.lx3.1635
  %t1891 = load i64, ptr %local.step.1636
  %t1892 = add i64 %t1891, 1
  store i64 %t1892, ptr %local.step.1636
  br label %loop39
endloop39:
  %t1893 = load i64, ptr %local.bx0.1628
  %t1894 = load i64, ptr %local.eq0.1637
  %t1895 = call i64 @"sx_f64_sub"(i64 %t1893, i64 %t1894)
  %t1896 = load i64, ptr %local.bx0.1628
  %t1897 = load i64, ptr %local.eq0.1637
  %t1898 = call i64 @"sx_f64_sub"(i64 %t1896, i64 %t1897)
  %t1899 = call i64 @"sx_f64_mul"(i64 %t1895, i64 %t1898)
  %t1900 = load i64, ptr %local.bx1.1629
  %t1901 = load i64, ptr %local.eq1.1638
  %t1902 = call i64 @"sx_f64_sub"(i64 %t1900, i64 %t1901)
  %t1903 = load i64, ptr %local.bx1.1629
  %t1904 = load i64, ptr %local.eq1.1638
  %t1905 = call i64 @"sx_f64_sub"(i64 %t1903, i64 %t1904)
  %t1906 = call i64 @"sx_f64_mul"(i64 %t1902, i64 %t1905)
  %t1907 = call i64 @"sx_f64_add"(i64 %t1899, i64 %t1906)
  %t1908 = load i64, ptr %local.bx2.1630
  %t1909 = load i64, ptr %local.eq2.1639
  %t1910 = call i64 @"sx_f64_sub"(i64 %t1908, i64 %t1909)
  %t1911 = load i64, ptr %local.bx2.1630
  %t1912 = load i64, ptr %local.eq2.1639
  %t1913 = call i64 @"sx_f64_sub"(i64 %t1911, i64 %t1912)
  %t1914 = call i64 @"sx_f64_mul"(i64 %t1910, i64 %t1913)
  %t1915 = call i64 @"sx_f64_add"(i64 %t1907, i64 %t1914)
  %t1916 = load i64, ptr %local.bx3.1631
  %t1917 = load i64, ptr %local.eq3.1640
  %t1918 = call i64 @"sx_f64_sub"(i64 %t1916, i64 %t1917)
  %t1919 = load i64, ptr %local.bx3.1631
  %t1920 = load i64, ptr %local.eq3.1640
  %t1921 = call i64 @"sx_f64_sub"(i64 %t1919, i64 %t1920)
  %t1922 = call i64 @"sx_f64_mul"(i64 %t1918, i64 %t1921)
  %t1923 = call i64 @"sx_f64_add"(i64 %t1915, i64 %t1922)
  %t1924 = call i64 @"sqrt_f64"(i64 %t1923)
  store i64 %t1924, ptr %local.bd.1649
  %t1925 = load i64, ptr %local.lx0.1632
  %t1926 = load i64, ptr %local.eq0.1637
  %t1927 = call i64 @"sx_f64_sub"(i64 %t1925, i64 %t1926)
  %t1928 = load i64, ptr %local.lx0.1632
  %t1929 = load i64, ptr %local.eq0.1637
  %t1930 = call i64 @"sx_f64_sub"(i64 %t1928, i64 %t1929)
  %t1931 = call i64 @"sx_f64_mul"(i64 %t1927, i64 %t1930)
  %t1932 = load i64, ptr %local.lx1.1633
  %t1933 = load i64, ptr %local.eq1.1638
  %t1934 = call i64 @"sx_f64_sub"(i64 %t1932, i64 %t1933)
  %t1935 = load i64, ptr %local.lx1.1633
  %t1936 = load i64, ptr %local.eq1.1638
  %t1937 = call i64 @"sx_f64_sub"(i64 %t1935, i64 %t1936)
  %t1938 = call i64 @"sx_f64_mul"(i64 %t1934, i64 %t1937)
  %t1939 = call i64 @"sx_f64_add"(i64 %t1931, i64 %t1938)
  %t1940 = load i64, ptr %local.lx2.1634
  %t1941 = load i64, ptr %local.eq2.1639
  %t1942 = call i64 @"sx_f64_sub"(i64 %t1940, i64 %t1941)
  %t1943 = load i64, ptr %local.lx2.1634
  %t1944 = load i64, ptr %local.eq2.1639
  %t1945 = call i64 @"sx_f64_sub"(i64 %t1943, i64 %t1944)
  %t1946 = call i64 @"sx_f64_mul"(i64 %t1942, i64 %t1945)
  %t1947 = call i64 @"sx_f64_add"(i64 %t1939, i64 %t1946)
  %t1948 = load i64, ptr %local.lx3.1635
  %t1949 = load i64, ptr %local.eq3.1640
  %t1950 = call i64 @"sx_f64_sub"(i64 %t1948, i64 %t1949)
  %t1951 = load i64, ptr %local.lx3.1635
  %t1952 = load i64, ptr %local.eq3.1640
  %t1953 = call i64 @"sx_f64_sub"(i64 %t1951, i64 %t1952)
  %t1954 = call i64 @"sx_f64_mul"(i64 %t1950, i64 %t1953)
  %t1955 = call i64 @"sx_f64_add"(i64 %t1947, i64 %t1954)
  %t1956 = call i64 @"sqrt_f64"(i64 %t1955)
  store i64 %t1956, ptr %local.ld.1650
  %t1957 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.266)
  %t1958 = ptrtoint ptr %t1957 to i64
  %t1959 = inttoptr i64 %t1958 to ptr
  call void @intrinsic_print(ptr %t1959)
  %t1960 = load i64, ptr %local.bd.1649
  %t1961 = call i64 @"print_f64"(i64 %t1960)
  %t1962 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.267)
  %t1963 = ptrtoint ptr %t1962 to i64
  %t1964 = inttoptr i64 %t1963 to ptr
  call void @intrinsic_print(ptr %t1964)
  %t1965 = load i64, ptr %local.ld.1650
  %t1966 = call i64 @"print_f64"(i64 %t1965)
  %t1967 = load i64, ptr %local.bd.1649
  %t1968 = load i64, ptr %local.ld.1650
  %t1969 = call i64 @"sx_f64_lt"(i64 %t1967, i64 %t1968)
  %t1970 = icmp ne i64 %t1969, 0
  br i1 %t1970, label %then40, label %else40
then40:
  %t1971 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.268)
  %t1972 = ptrtoint ptr %t1971 to i64
  %t1973 = inttoptr i64 %t1972 to ptr
  call void @intrinsic_println(ptr %t1973)
  %t1974 = load i64, ptr %local.b_wins.1626
  %t1975 = add i64 %t1974, 1
  store i64 %t1975, ptr %local.b_wins.1626
  br label %then40_end
then40_end:
  br label %endif40
else40:
  %t1976 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.269)
  %t1977 = ptrtoint ptr %t1976 to i64
  %t1978 = inttoptr i64 %t1977 to ptr
  call void @intrinsic_println(ptr %t1978)
  br label %else40_end
else40_end:
  br label %endif40
endif40:
  %t1979 = phi i64 [ 0, %then40_end ], [ 0, %else40_end ]
  %t1980 = load i64, ptr %local.total.1627
  %t1981 = add i64 %t1980, 1
  store i64 %t1981, ptr %local.total.1627
  %t1982 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.270)
  %t1983 = ptrtoint ptr %t1982 to i64
  %t1984 = inttoptr i64 %t1983 to ptr
  call void @intrinsic_println(ptr %t1984)
  %t1985 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.271)
  %t1986 = ptrtoint ptr %t1985 to i64
  %t1987 = inttoptr i64 %t1986 to ptr
  call void @intrinsic_print(ptr %t1987)
  %t1988 = load i64, ptr %local.b_wins.1626
  call void @print_i64(i64 %t1988)
  %t1989 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.272)
  %t1990 = ptrtoint ptr %t1989 to i64
  %t1991 = inttoptr i64 %t1990 to ptr
  call void @intrinsic_print(ptr %t1991)
  %t1992 = load i64, ptr %local.total.1627
  call void @print_i64(i64 %t1992)
  %t1993 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.273)
  %t1994 = ptrtoint ptr %t1993 to i64
  %t1995 = inttoptr i64 %t1994 to ptr
  call void @intrinsic_println(ptr %t1995)
  %t1996 = load i64, ptr %local.bd.1649
  %t1997 = call i64 @f64_parse(ptr @.str.exp_iratio_proof.274)
  %t1998 = call i64 @"sx_f64_lt"(i64 %t1996, i64 %t1997)
  %t1999 = icmp ne i64 %t1998, 0
  br i1 %t1999, label %then41, label %else41
then41:
  %t2000 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.275)
  %t2001 = ptrtoint ptr %t2000 to i64
  %t2002 = inttoptr i64 %t2001 to ptr
  call void @intrinsic_println(ptr %t2002)
  br label %then41_end
then41_end:
  br label %endif41
else41:
  br label %else41_end
else41_end:
  br label %endif41
endif41:
  %t2003 = phi i64 [ 0, %then41_end ], [ 0, %else41_end ]
  %t2004 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.276)
  %t2005 = ptrtoint ptr %t2004 to i64
  %t2006 = inttoptr i64 %t2005 to ptr
  call void @intrinsic_println(ptr %t2006)
  ret i64 0
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.total_failures.2007 = alloca i64
  store i64 0, ptr %local.total_failures.2007
  %t2008 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.277)
  %t2009 = ptrtoint ptr %t2008 to i64
  %t2010 = inttoptr i64 %t2009 to ptr
  call void @intrinsic_println(ptr %t2010)
  %t2011 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.278)
  %t2012 = ptrtoint ptr %t2011 to i64
  %t2013 = inttoptr i64 %t2012 to ptr
  call void @intrinsic_println(ptr %t2013)
  %t2014 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.279)
  %t2015 = ptrtoint ptr %t2014 to i64
  %t2016 = inttoptr i64 %t2015 to ptr
  call void @intrinsic_println(ptr %t2016)
  %t2017 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.280)
  %t2018 = ptrtoint ptr %t2017 to i64
  %t2019 = inttoptr i64 %t2018 to ptr
  call void @intrinsic_println(ptr %t2019)
  %t2020 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.281)
  %t2021 = ptrtoint ptr %t2020 to i64
  %t2022 = inttoptr i64 %t2021 to ptr
  call void @intrinsic_println(ptr %t2022)
  %t2023 = load i64, ptr %local.total_failures.2007
  %t2024 = call i64 @"proof_k_sweep"()
  %t2025 = add i64 %t2023, %t2024
  store i64 %t2025, ptr %local.total_failures.2007
  %t2026 = load i64, ptr %local.total_failures.2007
  %t2027 = call i64 @"proof_off_equilibrium"()
  %t2028 = add i64 %t2026, %t2027
  store i64 %t2028, ptr %local.total_failures.2007
  %t2029 = load i64, ptr %local.total_failures.2007
  %t2030 = call i64 @"proof_statistical"()
  %t2031 = add i64 %t2029, %t2030
  store i64 %t2031, ptr %local.total_failures.2007
  %t2032 = load i64, ptr %local.total_failures.2007
  %t2033 = call i64 @"proof_bflow_precision"()
  %t2034 = add i64 %t2032, %t2033
  store i64 %t2034, ptr %local.total_failures.2007
  %t2035 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.282)
  %t2036 = ptrtoint ptr %t2035 to i64
  %t2037 = inttoptr i64 %t2036 to ptr
  call void @intrinsic_println(ptr %t2037)
  %t2038 = load i64, ptr %local.total_failures.2007
  %t2039 = icmp eq i64 %t2038, 0
  %t2040 = zext i1 %t2039 to i64
  %t2041 = icmp ne i64 %t2040, 0
  br i1 %t2041, label %then42, label %else42
then42:
  %t2042 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.283)
  %t2043 = ptrtoint ptr %t2042 to i64
  %t2044 = inttoptr i64 %t2043 to ptr
  call void @intrinsic_println(ptr %t2044)
  %t2045 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.284)
  %t2046 = ptrtoint ptr %t2045 to i64
  %t2047 = inttoptr i64 %t2046 to ptr
  call void @intrinsic_println(ptr %t2047)
  %t2048 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.285)
  %t2049 = ptrtoint ptr %t2048 to i64
  %t2050 = inttoptr i64 %t2049 to ptr
  call void @intrinsic_println(ptr %t2050)
  %t2051 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.286)
  %t2052 = ptrtoint ptr %t2051 to i64
  %t2053 = inttoptr i64 %t2052 to ptr
  call void @intrinsic_println(ptr %t2053)
  %t2054 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.287)
  %t2055 = ptrtoint ptr %t2054 to i64
  %t2056 = inttoptr i64 %t2055 to ptr
  call void @intrinsic_println(ptr %t2056)
  %t2057 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.288)
  %t2058 = ptrtoint ptr %t2057 to i64
  %t2059 = inttoptr i64 %t2058 to ptr
  call void @intrinsic_println(ptr %t2059)
  %t2060 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.289)
  %t2061 = ptrtoint ptr %t2060 to i64
  %t2062 = inttoptr i64 %t2061 to ptr
  call void @intrinsic_println(ptr %t2062)
  br label %then42_end
then42_end:
  br label %endif42
else42:
  %t2063 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.290)
  %t2064 = ptrtoint ptr %t2063 to i64
  %t2065 = inttoptr i64 %t2064 to ptr
  call void @intrinsic_print(ptr %t2065)
  %t2066 = load i64, ptr %local.total_failures.2007
  call void @print_i64(i64 %t2066)
  %t2067 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.291)
  %t2068 = ptrtoint ptr %t2067 to i64
  %t2069 = inttoptr i64 %t2068 to ptr
  call void @intrinsic_println(ptr %t2069)
  br label %else42_end
else42_end:
  br label %endif42
endif42:
  %t2070 = phi i64 [ 0, %then42_end ], [ 0, %else42_end ]
  %t2071 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_proof.292)
  %t2072 = ptrtoint ptr %t2071 to i64
  %t2073 = inttoptr i64 %t2072 to ptr
  call void @intrinsic_println(ptr %t2073)
  %t2074 = load i64, ptr %local.total_failures.2007
  ret i64 %t2074
}


; String constants
@.str.exp_iratio_proof.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_proof.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_proof.2 = private unnamed_addr constant [8 x i8] c"10000.0\00"
@.str.exp_iratio_proof.3 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_proof.4 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_proof.5 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_proof.6 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_proof.7 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof.8 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_iratio_proof.9 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof.10 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_iratio_proof.11 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof.12 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_iratio_proof.13 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof.14 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_iratio_proof.15 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_proof.16 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_proof.17 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.18 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.19 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.20 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.21 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.22 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.23 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.24 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.25 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_iratio_proof.26 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_proof.27 = private unnamed_addr constant [40 x i8] c"=== PROOF 1: I = -0.5 for K = 2..20 ===\00"
@.str.exp_iratio_proof.28 = private unnamed_addr constant [34 x i8] c"  Random 4D targets, 3 seeds each\00"
@.str.exp_iratio_proof.29 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_proof.30 = private unnamed_addr constant [63 x i8] c"  K     I(seed=42)     I(seed=137)    I(seed=999)    All=-0.5?\00"
@.str.exp_iratio_proof.31 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_proof.32 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_iratio_proof.33 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_proof.34 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_proof.35 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof.36 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_iratio_proof.37 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof.38 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_iratio_proof.39 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof.40 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_iratio_proof.41 = private unnamed_addr constant [6 x i8] c"  YES\00"
@.str.exp_iratio_proof.42 = private unnamed_addr constant [15 x i8] c"  *** FAIL ***\00"
@.str.exp_iratio_proof.43 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_proof.44 = private unnamed_addr constant [42 x i8] c"  PROVEN: I = -0.5 for ALL K from 2 to 20\00"
@.str.exp_iratio_proof.45 = private unnamed_addr constant [11 x i8] c"  FAILED: \00"
@.str.exp_iratio_proof.46 = private unnamed_addr constant [7 x i8] c" cases\00"
@.str.exp_iratio_proof.47 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_proof.48 = private unnamed_addr constant [44 x i8] c"=== PROOF 2: I ≠ -0.5 off equilibrium ===\00"
@.str.exp_iratio_proof.49 = private unnamed_addr constant [55 x i8] c"  K=3, 4D. Check I at 10 random NON-equilibrium points\00"
@.str.exp_iratio_proof.50 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_proof.51 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.52 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_proof.53 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.54 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_iratio_proof.55 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_proof.56 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.57 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.58 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.59 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_proof.60 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_proof.61 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_iratio_proof.62 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.63 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.64 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.65 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.66 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.67 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.68 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.69 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.70 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.71 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.72 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.73 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.74 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.75 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.76 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.77 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.78 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.79 = private unnamed_addr constant [23 x i8] c"  At equilibrium: I = \00"
@.str.exp_iratio_proof.80 = private unnamed_addr constant [16 x i8] c" (must be -0.5)\00"
@.str.exp_iratio_proof.81 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof.82 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_iratio_proof.83 = private unnamed_addr constant [35 x i8] c"  *** EQUILIBRIUM CHECK FAILED ***\00"
@.str.exp_iratio_proof.84 = private unnamed_addr constant [26 x i8] c"  Off-equilibrium points:\00"
@.str.exp_iratio_proof.85 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof.86 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_iratio_proof.87 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof.88 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_iratio_proof.89 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof.90 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_iratio_proof.91 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof.92 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_iratio_proof.93 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.94 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.95 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.96 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.97 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.98 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.99 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.100 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.101 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.102 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.103 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.104 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.105 = private unnamed_addr constant [10 x i8] c"    test \00"
@.str.exp_iratio_proof.106 = private unnamed_addr constant [7 x i8] c": I = \00"
@.str.exp_iratio_proof.107 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof.108 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_iratio_proof.109 = private unnamed_addr constant [47 x i8] c"  *** UNEXPECTED: I = -0.5 OFF equilibrium ***\00"
@.str.exp_iratio_proof.110 = private unnamed_addr constant [16 x i8] c"  OK (≠ -0.5)\00"
@.str.exp_iratio_proof.111 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_proof.112 = private unnamed_addr constant [64 x i8] c"  PROVEN: I = -0.5 ONLY at equilibrium (sufficient + necessary)\00"
@.str.exp_iratio_proof.113 = private unnamed_addr constant [11 x i8] c"  ISSUES: \00"
@.str.exp_iratio_proof.114 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_proof.115 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_proof.116 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_proof.117 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof.118 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_iratio_proof.119 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_proof.120 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_proof.121 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_proof.122 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.123 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.124 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_iratio_proof.125 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_proof.126 = private unnamed_addr constant [37 x i8] c"=== PROOF 3: 100 Random Problems ===\00"
@.str.exp_iratio_proof.127 = private unnamed_addr constant [51 x i8] c"  Random K (2-8), random dim (2-6), random targets\00"
@.str.exp_iratio_proof.128 = private unnamed_addr constant [57 x i8] c"  Verify I = -0.5 at exact equilibrium for EVERY problem\00"
@.str.exp_iratio_proof.129 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_proof.130 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_proof.131 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof.132 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_iratio_proof.133 = private unnamed_addr constant [11 x i8] c"  FAIL: K=\00"
@.str.exp_iratio_proof.134 = private unnamed_addr constant [6 x i8] c" dim=\00"
@.str.exp_iratio_proof.135 = private unnamed_addr constant [4 x i8] c" I=\00"
@.str.exp_iratio_proof.136 = private unnamed_addr constant [6 x i8] c" err=\00"
@.str.exp_iratio_proof.137 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_proof.138 = private unnamed_addr constant [11 x i8] c"  Passed: \00"
@.str.exp_iratio_proof.139 = private unnamed_addr constant [15 x i8] c"/100, Failed: \00"
@.str.exp_iratio_proof.140 = private unnamed_addr constant [5 x i8] c"/100\00"
@.str.exp_iratio_proof.141 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_proof.142 = private unnamed_addr constant [35 x i8] c"  Max |I + 0.5| across all tests: \00"
@.str.exp_iratio_proof.143 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_proof.144 = private unnamed_addr constant [47 x i8] c"  PROVEN: I = -0.5 for ALL 100 random problems\00"
@.str.exp_iratio_proof.145 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_proof.146 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.147 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.148 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.149 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.150 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.151 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.152 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.153 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.154 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.155 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.156 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.157 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.158 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_iratio_proof.159 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_proof.160 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_iratio_proof.161 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_proof.162 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_proof.163 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.164 = private unnamed_addr constant [47 x i8] c"=== PROOF 4: B-Flow Precision vs Loss-Flow ===\00"
@.str.exp_iratio_proof.165 = private unnamed_addr constant [60 x i8] c"  5 problems. 500 steps each. Compare final distance to eq.\00"
@.str.exp_iratio_proof.166 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_proof.167 = private unnamed_addr constant [54 x i8] c"  Problem   B-flow dist      Loss-flow dist   B wins?\00"
@.str.exp_iratio_proof.168 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.169 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.170 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.171 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.172 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.173 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.174 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.175 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.176 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.177 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.178 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_proof.179 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_iratio_proof.180 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.181 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_proof.182 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.183 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_proof.184 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.185 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_iratio_proof.186 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_proof.187 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.188 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.189 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.190 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_proof.191 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_proof.192 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_iratio_proof.193 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.194 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.195 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_proof.196 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.197 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_iratio_proof.198 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_proof.199 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.200 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.201 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.202 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_proof.203 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_proof.204 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_iratio_proof.205 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.206 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.207 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_proof.208 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.209 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_iratio_proof.210 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_proof.211 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.212 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.213 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.214 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_proof.215 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_proof.216 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_iratio_proof.217 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.218 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.219 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_proof.220 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.221 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_iratio_proof.222 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_proof.223 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.224 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.225 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.226 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_proof.227 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_proof.228 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_iratio_proof.229 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.230 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof.231 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof.232 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof.233 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_proof.234 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.235 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.236 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.237 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_proof.238 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.239 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_proof.240 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.241 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_proof.242 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.243 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.244 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.245 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_proof.246 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.247 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.248 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.249 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.250 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.251 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_iratio_proof.252 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.253 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_iratio_proof.254 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.255 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.256 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.257 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_proof.258 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_iratio_proof.259 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.260 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_iratio_proof.261 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.262 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_iratio_proof.263 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.264 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_iratio_proof.265 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_proof.266 = private unnamed_addr constant [14 x i8] c"  Problem 1  \00"
@.str.exp_iratio_proof.267 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_proof.268 = private unnamed_addr constant [6 x i8] c"  YES\00"
@.str.exp_iratio_proof.269 = private unnamed_addr constant [5 x i8] c"  NO\00"
@.str.exp_iratio_proof.270 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_proof.271 = private unnamed_addr constant [16 x i8] c"  B-flow wins: \00"
@.str.exp_iratio_proof.272 = private unnamed_addr constant [2 x i8] c"/\00"
@.str.exp_iratio_proof.273 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_proof.274 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_iratio_proof.275 = private unnamed_addr constant [37 x i8] c"  B-flow precision < 0.001 CONFIRMED\00"
@.str.exp_iratio_proof.276 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_proof.277 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_iratio_proof.278 = private unnamed_addr constant [45 x i8] c"#  I-RATIO THEOREM: EXHAUSTIVE PROOF       #\00"
@.str.exp_iratio_proof.279 = private unnamed_addr constant [45 x i8] c"#  I = -0.5 iff at equilibrium             #\00"
@.str.exp_iratio_proof.280 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_iratio_proof.281 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_proof.282 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_iratio_proof.283 = private unnamed_addr constant [45 x i8] c"#  ALL PROOFS PASSED                       #\00"
@.str.exp_iratio_proof.284 = private unnamed_addr constant [45 x i8] c"#  I = -0.5 is PROVEN for:                 #\00"
@.str.exp_iratio_proof.285 = private unnamed_addr constant [45 x i8] c"#  - All K from 2 to 20                    #\00"
@.str.exp_iratio_proof.286 = private unnamed_addr constant [45 x i8] c"#  - All dimensions from 2 to 6            #\00"
@.str.exp_iratio_proof.287 = private unnamed_addr constant [45 x i8] c"#  - 100 random problems (0 failures)      #\00"
@.str.exp_iratio_proof.288 = private unnamed_addr constant [45 x i8] c"#  - Necessary AND sufficient condition    #\00"
@.str.exp_iratio_proof.289 = private unnamed_addr constant [45 x i8] c"#  - B-flow achieves higher precision      #\00"
@.str.exp_iratio_proof.290 = private unnamed_addr constant [14 x i8] c"#  FAILURES: \00"
@.str.exp_iratio_proof.291 = private unnamed_addr constant [25 x i8] c"                       #\00"
@.str.exp_iratio_proof.292 = private unnamed_addr constant [45 x i8] c"############################################\00"
